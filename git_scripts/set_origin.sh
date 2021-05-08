#!/bin/zsh

# This script executes sets remote origin in each local repo in the $DIR directory.
# I use this script to switch URLs from HTTPS to SSH

# colors
RED="\e[1;31m"
MAGENTA="\e[1;35m"
BLUE="\e[1;34m"
ENDCOLOR="\e[0m"

# !!!!!!!!!
# set $DIR!
# !!!!!!!!!
DIR="/home/cidem/Documents/GitHub/Mine/"

dir_count=`ls -l | grep ^d | wc -l | xargs`
cd $DIR

i=0
for dir in */; do
        ((i++))

        echo -e "$RED $i/$dir_count : In $dir $ENDCOLOR"

        dir_path="$DIR$dir"
        cd $dir_path  #enter the repo

        git remote set-url origin git@github.com:panicwithme/${dir%?}.git
	git remote -v

        echo -e "$MAGENTA $dir done $ENDCOLOR"
        echo "=========================================================="
done

echo -e "$BLUE Done. Bye! $ENDCOLOR"

