#!/bin/bash

source ./variables.txt
source ./functions.txt

#create zipped archive of valheim backup folder
tar -czf ${todaysbackup:?undefined} ${valheimfiles:?undefined}

#copy archive to s3 bucket
aws s3 cp ${todaysbackup:?undefined} s3://${mys3bucket:?undefined}

#clean up todays backup file locally
rm ${todaysbackup:?undefined}


printf "\nFiles now in S3:\n"
aws_ls
