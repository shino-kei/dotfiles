echo "installing dein"

dir=`readlink -f $(dirname $0)`

if [ -e  $home/.vim/dein ]; then
  echo "dein already installed :skiped"
else
  curl https://raw.githubusercontent.com/shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  mkdir $home/.vim/dein
  sh /tmp/installer.sh $home/.vim/dein
  rm -f /tmp/installer.sh
fi

mkdir -p $home/.vim/dein/toml
ln -sf ${dir}/vim/dein.toml ~/.vim/dein/toml/dein.toml
ln -sf ${dir}/vim/dein_lazy.toml ~/.vim/dein/toml/dein_lazy.toml
