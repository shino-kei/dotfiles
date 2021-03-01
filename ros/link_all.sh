#! /bin/bash

DST=$HOME/3rdparty/bin
mkdir -p $DST

while read -d $'\0' file; do
    echo "${file}: make symbolic link to ${DST}"
    output=$(basename ${file} .sh)
    ln -srf ${file} $DST/${output}
done < <(find ./bin -mindepth 1 -maxdepth 1 -print0)
