#! /bin/sh

# https://dev.to/asyncedd/building-neovim-from-source-1794

apt-get update
apt-get --assume-yes install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git
git clone https://github.com/neovim/neovim.git /neovim
cd /neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
