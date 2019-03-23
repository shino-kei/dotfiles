#!/bin/zsh

DIR=~/dotfiles

# 初回のみzpreztoをインストールする
if [ ! -e ~/.zprezto ]; then 
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
      mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv .zshrc zsh_orig

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

ln -sf ${DIR}/zshrc_zprezto ~/.zshrc
ln -sf ${DIR}/zpreztorc ~/.zpreztorc
# ln -sf ${DIR}/tmux.conf ~/.tmux.conf
ln -sf ${DIR}/vimrc ~/.vimrc
  # ln -sf ${DIR}/gitconfig ~/.gitconfig
ln -sf ${DIR}/dircolors.256dark ~/.dircolors

# OSごとの設定
case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定を書く
    zsh ${DIR}/install_dein.sh

    ;;
  linux*)
    # ここに linux向けの設定
    cp ${DIR}/ros/setup_ros_ws.sh ~/.setup_ros_ws.sh
    zsh ${DIR}/install_dein.sh
    ;;

  cygwin)
    # ここに，cygwin(windows)向け設定を書く
    ln -sf ${DIR}/minttyrc ~/.minttyrc
    zsh ${DIR}/install_dein.sh
    ;;


esac
