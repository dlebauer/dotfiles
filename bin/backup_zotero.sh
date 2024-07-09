#!/bin/bash

# sync to ~/backups
#   this is a symbolic link to my cloud drive e.g.
#   ln -s "/Users/dlebauer/OneDrive - The LeBauer Approach LLC/backups/" ~/backups

# assumes export PATH=$HOME/bin:$PATH in .zshrc or .bashrc
# schedule: Monday at 9AM local time 
#   crontab -e
#   # Add a line to schedule the backup. For example, to run the script daily at 2 AM:
#   0 9 * * 1 backup_zotero.sh

rsync -av --delete /Users/username/Zotero/ /Users/username/backups/zotero_backup/

