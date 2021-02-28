if [ -x "`which go`" ]; then
  export GOPATH=$HOME/3rdparty/go
  export PATH="$GOPATH/bin:$PATH"

  if [ ! -x $GOPATH ]; then
    echo "GOPATH(${GOPATH})does not exit. create it? (y/N):"  
    if read -q; then
      echo "create ${GOPATH}"
      mkdir -p ${GOPATH}
    else
      echo abort
    fi
  fi
fi
