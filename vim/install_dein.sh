#! /bin/bash

echo "installing dein"

dir=`readlink -f $(dirname $0)`

if [ -e  $HOME/.vim/dein ]; then
  echo "dein already installed :skiped"
else
  curl https://raw.githubusercontent.com/shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  mkdir $HOME/.vim/dein
  sh /tmp/installer.sh $HOME/.vim/dein
  rm -f /tmp/installer.sh
fi

mkdir -p $HOME/.vim/dein/toml
ln -sf ${dir}/vim/dein.toml ~/.vim/dein/toml/dein.toml
ln -sf ${dir}/vim/dein_lazy.toml ~/.vim/dein/toml/dein_lazy.toml
