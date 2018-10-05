#!/bin/sh
artists=`/bin/ls -1BI '*.sh' | wc -l`
present=`/bin/ls -1B */* | wc -l`
total=`cat */.tracks | wc -l | xargs -I {} expr {} / 2`
echo "Library:"
echo "  $artists artists"
echo "  $total tracks listed"
echo "  $present tracks downloaded"
echo "  $(expr $total - $present) tracks missed"
