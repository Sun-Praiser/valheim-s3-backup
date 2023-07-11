#!/bin/bash

printf "\n********** RUNNING BACKUP FOR $(date +%F) ***********\n"

bash ./remove-old.sh

bash ./copy-to-s3.sh

printf "\n********** BACKUP COMPLETE FOR $(date +%F) ***********\n"
