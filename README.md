Simple S3 Backup
----------------

A simple Ruby script to back up databases, directories, and git repositories to Amazon S3 (Simple Storage Service).

Steps for using:

1. Rename settings-sample.rb to settings.rb
2. In settings.rb, fill in specific command paths, your Amazon API credentials, MySQL login info & databases, and any directories you want backed up
3. Set the script to run with cron - I have mine run every night.

To do:

1. Set a time limit for expiring previous backups
2. Clear out files no longer needed for archiving?
