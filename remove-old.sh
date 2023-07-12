#!/bin/bash

source ./variables.txt
source ./functions.txt

#check all backup files in S3 bucket and create a text file containing all backup filenames
aws_ls | grep tar | cut -d "v" -f 2 | cut -c 8-17 > /tmp/backups.txt

#check the age of every file in S3 using the text file. Delete backups older than 7 days
while read line;
do
	today=$(date +%s)
	created=$(date -d $line +%s)
	age=$(( ( $today - $created )/(60*60*24) ))

	backupfile="valheim-${line}.tar.zip"

	if [[ ${age:?undefined} > 7 ]]; then
		printf "${backupfile:?undefined} is ${age} days old\n Deleting now...\n"
		aws s3 rm s3://${mys3bucket:?undefined}/${backupfile:?undefined}
	else
		printf "${backupfile:?undefined} is less than 7 days old\n"
	fi
done < /tmp/backups.txt

#clean up backups file from tmp
rm /tmp/backups.txt

printf "\nFiles remaining in S3:\n"
aws_ls
