#!/bin/sh
for dir in ./*/
do
  cd $dir
  cat .tracks | while read -r file ;
  do
	read -r link
	wget -O "$file.mp3" $link
  done
  cd ..
done
