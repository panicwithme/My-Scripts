#!/bin/zsh

# This scripts loops through Downloads directory.
# For each file it asks if you want to remove the file/directory.
# You can also see the content of the file/directory.
# It is useful for me since my Downloads gets cluttered frequently.

# !!!!!!!!!!!!!!!!!!!!
# Change $DIR
DIR="/home/x/Downloads/"

# If $DIR does not exist, exit.
if [[ ! -e "$DIR" ]]; then
	echo "$DIR does not exist."
	exit
else
	cd $DIR
fi

# If $DIR is empty, exit.
if [[ -z "$(ls -A $DIR)" ]]; then
	echo "$DIR is empty. Nice!"
	exit
fi

# colors
RED="\e[1;31m"
BLUE="\e[1;34m"
ENDCOLOR="\e[0m"

deleted_files=()

echo -e "$RED 'rm' to remove the file. $ENDCOLOR"
echo -e "$RED 'see' to see the file. $ENDCOLOR"
echo -e "$RED press enter or write anything else to skip. $ENDCOLOR \n"

for file in *; do
	echo -e "$BLUE ================================================= $ENDCOLOR"
	echo `file "$file"`
	echo -n "rm/see/[enter]: "

	while true; do
 		read input

		if [[ "$input" == "rm" ]]; then
			if [[ -d "$file" ]]; then
				rm -rv $file
			else
				rm -v $file
			fi
			deleted_files+=("$file")
			break

		elif [[ "$input" == "see" ]]; then
			xdg-open "$file" > /dev/null 2>&1 &
			echo -n "rm/see/[enter]: "

		else
			break
		fi 

	done

done

echo -e "$BLUE ================================================= $ENDCOLOR"
echo -e "$RED DELETED FILES:"
echo ${deleted_files[@]}
