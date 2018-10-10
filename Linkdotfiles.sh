#!/bin/zsh

source ~/zsh/install_app.sh

# 初回のみzpreztoをインストールする
if [ ! -e ~/.zprezto ]; then 
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv .zshrc zsh_orig

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

ln -sf ~/dotfiles/zshrc_zprezto ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/dircolors.256dark ~/.dircolors
ln -sf ~/dotfiles/setup_ros.sh ~/setup_ros.sh

# OSごとの設定
case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定を書く
    zsh ~/dotfiles/install_dein.sh

    ;;
  linux*)
    # ここに linux向けの設定
    zsh ~/dotfiles/install_dein.sh
    ;;

  cygwin)
    # ここに，cygwin(windows)向け設定を書く
    ln -sf ~/dotfiles/minttyrc ~/.minttyrc
    zsh ~/dotfiles/install_dein.sh
    ;;


esac
