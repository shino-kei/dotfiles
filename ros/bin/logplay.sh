#! /bin/bash

usage_exit()
{
  echo "USAGE: $0 [-s time] filename "
}


SKIP=0



while getopts s:r:h OPT
do
  case $OPT in
    s)  SKIP=$OPTARG
      echo "skip ${SKIP} seconds"
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

shift $((OPTIND - 1))

file=$1
echo $file
if [ -z $file ]; then
  file=$(ls |grep bag |fzf)
fi


if ! type rosbag > /dev/null 2>&1; then 
  echo No command found with name rosbag
  exit 1
fi

rosbag play $file --clock tf:=tf_old tf_static:=tf_static_old -s $SKIP 


