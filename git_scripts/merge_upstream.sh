#!/bin/zsh

# This script merges upstream repositories into your fork repos.
# Set $DIR as your forked repos' main directory.

# colors
RED="\e[1;31m"
MAGENTA="\e[1;35m"
BLUE="\e[1;34m"
ENDCOLOR="\e[0m"

# !!!!!!!!!
# set $DIR!
# !!!!!!!!!
DIR="/home/x/Forks/"

dir_count=`ls -l | grep ^d | wc -l | xargs`
cd $DIR

i=0
for dir in */; do
	((i++))

	echo -e "$RED $i/$dir_count : In $dir $ENDCOLOR"

	dir_path="$DIR$dir"
	cd $dir_path

	git checkout master #merge to master
	git pull upstream master
	git push

	echo -e "$MAGENTA $dir done $ENDCOLOR"
	echo "=========================================================="
done

echo -e "$BLUE Done. Bye! $ENDCOLOR"
