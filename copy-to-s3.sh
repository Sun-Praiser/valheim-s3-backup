#!/bin/bash

source ./variables.txt
today=$(date +%F)

#create zipped archive of valheim backup folder
tar -czf /tmp/valheim-${today:?undefined}.tar.zip /home/steam/.config/unity3d/IronGate/Valheim/worlds_local/*

#copy archive to s3 bucket
aws s3 cp /tmp/valheim-${today:?undefined}.tar.zip s3://${mys3bucket:?undefined}

rm /tmp/valheim-${today:?undefined}.tar.zip


printf "\nFiles now in S3:\n"
aws s3 ls s3://${mys3bucket:?undefined}
