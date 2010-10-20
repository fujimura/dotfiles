#! /bin/sh
file=~/log
done=$1
time=`date +%Y/%m/%d\ %H:%M\ `

if [[ ${done} == 'done' ]]
then
  sed -i '$s/$/ *done*/g' $file
  tail -n1 $file
elif test ${done}
then
  echo $time $done >> $file
else
  tail -n5 $file
fi
