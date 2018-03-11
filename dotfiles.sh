#!/bin/bash

# dotfiles.sh
# Steffen Johansen
# Installs config files - room for lots of optimization
# Will error if already linked I believe

# Go to the directory of all the dotfiles
DOTFILES="$PWD/dotfiles"
cd $DOTFILES

# === Konsole - Monokai theme ===
IPATH="/home/$USER/.local/share/konsole"
if [ ! -d "$IPATH" ]; then
    mkdir -p "$IPATH"
fi

if [ ! -f "$IPATH/monokai.colorscheme" ]; then
    echo "[*] Installing monokai theme for Konsole"

    if [ -f "$PWD/monokai.colorscheme" ]; then
        echo "[*] Linking monokai theme for Konsole"
        ln -s "$PWD/monokai.colorscheme" "$IPATH"
    else
        echo "[*] Downloading and moving monokai theme for Konsole"
        wget "https://raw.githubusercontent.com/tommodore/monokai/master/Konsole/monokai.colorscheme"
        mv monokai.colorscheme "$IPATH"
    fi
fi


# === Oh-My-Zsh ===
IPATH="/home/$USER/.oh-my-zsh"
if [ ! -d "$IPATH" ]; then
    echo "[*] Cloning oh-my-zsh repo to $IPATH"
    git clone "git://github.com/robbyrussell/oh-my-zsh.git" "$IPATH"
    echo "[*] oh-my-zsh successfully installed"
fi

# === TMUX Plugin Manager - TPM ===
IPATH="/home/$USER/.tmux/plugins/tpm"
echo "DEBUG: $IPATH"
if [ ! -d "$IPATH" ]; then
    echo "[*] Downloading TPM - plugin manager for tmux"
    git clone https://github.com/tmux-plugins/tpm "$IPATH"
    echo "[*] TPM installed."
fi


# === VIM-plug ===
IPATH="/home/$USER/.local/share/nvim/site/autoload"
if [ ! -d "$IPATH" ]; then
    mkdir -p "$IPATH"
fi

if [ ! -f "$IPATH/plug.vim" ]; then
    echo "[*] Downloading and moving vim-plug"
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mv "$PWD/plug.vim" "$IPATH"
fi




# ==== CONFIG ====
# === Konsole - config ===
IPATH="/home/$USER/.config"
if [ ! -d "$IPATH" ]; then
    mkdir -p "$IPATH"
fi

if [ -f "$IPATH/konsolerc" ]; then
    rm "$IPATH/konsolerc"
fi
echo "[*] Linking the konsole config"
ln -s "$PWD/konsolerc" "$IPATH"



# === Konsole - profile ===
IPATH="/home/$USER/.local/share/konsole/"
if [ ! -f "$IPATH/hacker.profile" ]; then
    echo "[*] Linking the konsole config hacker.profile"
    ln -s "$PWD/hacker.profile" "$IPATH"
fi

# === nvim - config ===
IPATH="/home/$USER/.config/nvim"
if [ ! -d "$IPATH" ]; then
    mkdir -p "$IPATH"
fi

if [ ! -f "$IPATH/init.vim" ]; then
    echo "[*] Linking init.vim"
    ln -s "$PWD/init.vim" "$IPATH"
fi


# === TMUX - config
IPATH="/home/$USER"
if [ ! -f "$IPATH/.tmux.conf" ]; then
    echo "[*] Linking .tmux.conf"
    ln -s "$PWD/tmux.conf" "$IPATH/.tmux.conf"
fi


# === Zshrc ===
IPATH="/home/$USER"
if [ ! -f "$IPATH/.zshrc" ]; then
    echo "[*] Copying .zshrc."
    ln -s "$PWD/zshrc" "$IPATH/.zshrc"

    # If relevant, run this manually
    echo "[!] Changing shell. You may be asked for your password"
    chsh -s "/bin/zsh"
fi


