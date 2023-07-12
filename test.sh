#!/bin/bash

#source ./variables.txt
source ./functions.txt

aws_ls

printf "\n\n${valheimfiles}\n"
printf "\n\n${today:?undefined}\n"
printf "\n\n${todaysbackup}\n"
