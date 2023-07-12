# valheim-s3-backup
Copies Valheim db and backup files to S3 bucket

## Scripts and Files
- backup.sh
	- The main script that runs copy-to-s3.sh and remove-old.sh.
- remove-old.sh
	- Deletes backup files in the S3 bucket that are older than 7 days.
- copy-to-s3.sh
	- creates a zipped archive of the valheim worlds folder and uploads it to the S3 bucket.
- variables.txt
	- Contains variables used by the scripts:
	- today=$(date +%F)
	- todaysbackup="/tmp/valheim-${today:?undefined}.tar.zip"
	- valheimfiles="/home/steam/.config/unity3d/IronGate/Valheim/worlds_local/*"
	- mys3bucket=
- functions.txt
	- contains a functions used by the scripts:
	- aws_ls: lists the files inside the S3 bucket


A cronjob is used to run the backup script nightly, logging the results in /var/log
