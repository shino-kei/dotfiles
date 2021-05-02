source $HOME/.cargo/env

if [ ! -x "`which rustc`" ]; then
 curl https://sh.rustup.rs -sSf | sh 

fi
