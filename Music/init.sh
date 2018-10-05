#!/bin/sh
for dir in $HOME/Music/*/
do
  cd "$dir"
  cat .tracks | while read -r file ;
  do
	read -r link
	if [ -f "$file.mp3" ]; then
	  echo "$file.mp3 is already in library. Skipping..."
	else
	  wget -O "$file.mp3" $link
	fi
  done
  cd ..
done
