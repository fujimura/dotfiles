#! /bin/sh
file=~/log
done=$1
if test ${done}
then
  echo `date +%Y/%m/%d\ %H:%M\ ` $done >> $file
else
  tail -n1 $file
fi
