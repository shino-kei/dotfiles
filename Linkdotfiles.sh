#!/bin/sh

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# OSごとの設定
case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定
    ;;
  linux*)
    # ここに linux向けの設定
    ;;

  cygwin)
    # ここに，cygwin(windows)向け設定を書く
    ln -sf ~/dotfiles/.minttyrc ~/.minttyrc
    ;;


esac