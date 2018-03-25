#!/bin/bash


mkdir "/tmp/neovim"
cd "/tmp/neovim"
git clone "https://github.com/neovim/neovim.git"
cd neovim
make
echo "Asks for root (su) to call make install of neovim"
su
make install
