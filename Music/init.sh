#!/bin/sh
declare -i total=0
declare -i downloaded=0
declare -i skipped=0
declare -i failed=0
for dir in $HOME/Music/*/
do
  cd "$dir"
  cat .tracks | while read -r file ;
  do
	read -r link
	if [ -f "$file.mp3" ]; then
	  echo "$file.mp3 is already in library. Skipping..."
	  skipped+=1
	else
	  wget -O "$file.mp3" $link && downloaded+=1 || failed+=1
	fi
	total+=1
  done
  cd ..
done
echo "Processed $total files:"
echo "  $downloaded downloaded"
echo "  $failed failed"
echo "  $skipped skipped"
