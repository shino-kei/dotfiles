if [ -x "`which go`" ]; then
  export GOPATH=$HOME/3rdparty/go
  export PATH="$GOPATH/bin:$PATH"

  
  if [ ! -x $GOPATH ]; then
    echo "GOPATH does not exit. create it? (y/N):"  
    read -n 1 yn
    if [[ $yn = [yY] ]]; then
      mkdir -p ${GOPATH}
    fi
  fi
fi
