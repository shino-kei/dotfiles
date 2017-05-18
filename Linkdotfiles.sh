#!/bin/zsh

ln -sf ~/dotfiles/zshrc_zprezto ~/.zshrc
ln -sf ~/dotfiles/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/vimrc ~/.vimrc

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
    ln -sf ~/dotfiles/.minttyrc ~/.minttyrc
    ;;


esac
