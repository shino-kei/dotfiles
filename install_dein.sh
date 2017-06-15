echo "installing dein"

if [ -e  $HOME/.vim/dein ]; then
  echo "dein already installed :skiped"
else
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  mkdir $HOME/.vim/dein
  sh /tmp/installer.sh $HOME/.vim/dein
fi
