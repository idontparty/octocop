#!/bin/bash

# setup.sh
# Steffen Johansen
# March 2018
# Install script for a new distro - Currently only working with APT packages

# Known bugs: extra whitespace after each package - too lazy to fix rn
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# Where the config files are located
APT_LIST="$PWD/files/apt_list.txt"
PIP_LIST="$PWD/files/pip_list.txt"



# ++++ FUNCTIONS ++++
# Function for printing command line arguments
function help {
    echo "Usage: $0 [OPTION]"
    echo -e "Toolkit for installing a list of packages.\n"
    echo "=========================="
    echo -e "-i, --install\t<packages>\tInstall packages separated by spaces"
    echo -e "-l, --list\t<packages>\tList available packages separated by spaces"
    echo -e "-h, --help\t\t\tDisplay this help and exit"
    echo -e "==========================\n"
    echo "Note that only one option can be used at a time - for now."
}


# Takes in the name of a sw group and creates a list over all the sw in the
# group
function group_parser {
    GROUPNAME="$i"
    PACKAGES_LIST=""
    READ=false

    while read -r line; do
        if [[ "$line" =~ "[$GROUPNAME]" ]]; then
            # Begin scan
            READ=true
        elif [[ "$line" =~ "[end]" ]]; then
            # Stop scan
            READ=false
        elif [[ $READ == true ]]; then
            PACKAGES_LIST="$PACKAGES_LIST$line "
        fi
    done < "$APT_LIST"

    # DEBUG MESSAGE
    echo  "Packages for [$GROUPNAME]: $PACKAGES_LIST"

}


# Parses relevant software groups into a list software packages
function package_parser {
    shift
    PACKAGES=""
    PACKAGE_GROUPS=""
    TMP="$@"

    # Go through every element - check if starts with '-', if it does, early
    # exit, or if it doesn't, append to packages list
    for i in $TMP; do
        if [[ "$i" =~ ^\- ]]; then
            break
        fi
        PACKAGE_GROUPS="$PACKAGE_GROUPS$i "
    done

    # DEBUG MESSAGE
    echo "Packages: $PACKAGE_GROUPS"

    # Go over each package-group and fetch all the packages from apt_list
    for i in $PACKAGE_GROUPS; do
        group_parser "$i"
        PACKAGES="$PACKAGES$PACKAGES_LIST "
    done
}


# Prints the usage message
function print_usage {
    # Note, $0 might cause bugs if you rename it to something wizardry
    echo "Usage: $0 [OPTION], use -h for help."
    exit
}


# Main - does whatever the user tells it to
function main {
    if [ $# -eq 0 ]; then
        print_usage
    fi

    # Stolen from https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
    while  [[ $# -gt 0 ]]; do
        key="$1"

        case "$key" in
            -h|--help)
                help
                shift # past argument
                shift # past value
                ;;
            -i|--install)
                package_parser "$@"
                echo "Installing: $PACKAGES"

                # Requires root
                # Disabled for dev purposes
                #apt install "$PACKAGES";

                shift # past argument
                shift # past value
                ;;

            -l|--list)
                package_parser "$@"
                shift # past argument
                shift # past value
                ;;
            --default)
                shift # past argument
                ;;
            *)  # unknown option
                shift # past argument
                ;;
        esac
    done
}


# Call main
main "$@"
