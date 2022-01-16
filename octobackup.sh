#!/bin/bash
#
# Backup OCTOPRINT DATA TO NAS
# This assumes nas is mounted to /home/pi/nasmount/ and octoprint files mounted to /home/pi/OCTOPRINT/

echo *************Starting script*************
echo *************DATE AND TIME*************
date
echo ***********LIST ZIP************
ls /home/pi/OCTOPRINT/octoprint/data/backup/
echo *************ZIP BACKUP*************
# copying zips to backup
cp -v /home/pi/OCTOPRINT/octoprint/data/backup/octoprint-*.zip  /home/pi/nasmount/backups/
echo *************ZIP CLEAN UP*************
# removing old zips older than 30 days
find /home/pi/OCTOPRINT/octoprint/data/backup -name "*.zip" -type f -mtime +30 -delete 
ls /home/pi/OCTOPRINT/octoprint/data/backup/
echo *************GCODE BACKUP*************
echo *******NEW FILES****************
find /home/pi/OCTOPRINT/octoprint/uploads -name "*.*" -type f -mtime +14
#copying gcode files to nas without overwrite 
cp -nruv /home/pi/OCTOPRINT/octoprint/uploads/   /home/pi/nasmount/dockmount/octoprint/
echo *************DONE*************
date

