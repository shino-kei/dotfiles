#!/bin/zsh

DIR=`readlink -f $(dirname $0)`

# 初回のみzpreztoをインストールする
if [ ! -e ~/.zprezto ]; then 
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
      mkdir zsh_orig && mv zshmv .zlogin .zlogout .zprofile .zshenv .zshrc zsh_orig

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

# install tmux plugin manager
if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# set git alias 
git config --global alias.tree 'log --graph --all --format="%x09%C(cyan bold)%an%Creset%x09%C(yellow)%h%Creset %C(magenta reverse)%d%Creset %s"'

# make symbolic links
ln -sf ${DIR}/zsh/zshrc_zprezto ~/.zshrc
ln -sf ${DIR}/zsh/zpreztorc ~/.zpreztorc
ln -sf ${DIR}/tmux.conf ~/.tmux.conf
ln -sf ${DIR}/vimrc ~/.vimrc
ln -sf ${DIR}/git/gitconfig ~/.gitconfig
ln -sf ${DIR}/dircolors.256dark ~/.dircolors

# OSごとの設定
case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定を書く
    zsh ${DIR}/install_dein.sh

    ;;
  linux*)
    # ここに linux向けの設定
    cp -n ${DIR}/ros/setup_ros_ws.sh ~/.setup_ros_ws.sh
    zsh ${DIR}/install_dein.sh
    bash ${DIR}/cpp/install_clangd.sh
    bash $DIR/vscode/link_vscode_config.sh
    ;;

  cygwin)
    # ここに，cygwin(windows)向け設定を書く
    ln -sf ${DIR}/minttyrc ~/.minttyrc
    zsh ${DIR}/install_dein.sh
    ;;


esac
