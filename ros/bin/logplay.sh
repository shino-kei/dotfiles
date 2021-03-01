#! /bin/bash

usage_exit()
{
  echo "USAGE: $0 [filename] [-s time] "
}


SKIP=0
file=$1

echo $file
if [ -z $file ]; then
  file=$(ls |grep bag |fzf)
fi


while getopts hs:r: OPT

do
  case $OPT in
    s)  SKIP=$OPTARG
      ;;
    r)  RATE=$OPTARG
      ;;
    h)  usage_exit
      exit 0
      ;;
    \?) usage_exit
      exit 0
      ;;
  esac
done


if ! type rosbag > /dev/null 2>&1; then 
  echo No command found with name rosbag
  exit 1
fi

rosbag play $file --clock tf:=tf_old tf_static:=tf_static_old -s $SKIP 


