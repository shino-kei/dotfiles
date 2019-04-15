#! /bin/bash
sudo apt install clang-6.0 clang-tools-6.0
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-6.0 100
