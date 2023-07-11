# valheim-s3-backup
Copy Valheim db and backup files to S3 bucket

backup.sh is the main script that runs copy-to-s3.sh and remove-old.sh.

remove-old.sh deletes backup files in the S3 bucket that are older than 7 days.

copy-to-s3.sh creates a zipped archive of the valheim worlds folder and uploads it to the S3 bucket.


the $mys3bucket variable is sourced from a file that needs to be created and added to this directory

a cronjob is used to run the backup script nightly, logging the results in /var/log
