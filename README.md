Simple S3 Backup
----------------

A simple Ruby script to back up MySQL database tables, full directories, and groups of single files to Amazon S3 (Simple Storage Service).

Steps for using:

1. What you'll need to run the script:
 * The aws/s3 Ruby gem: <http://amazon.rubyforge.org/>
 * An Amazon S3 account: <http://aws.amazon.com/s3/>
2. Rename settings-sample.rb to settings.rb
3. In settings.rb, fill in specific command paths, your Amazon API credentials, MySQL login info & databases, and any directories you want backed up
4. Set the script to run with cron - I have mine run every night, like so:

`15 3 * * * /usr/bin/ruby /home/username/backups/simple-s3-backup.rb`


To do:

1. Set a time limit for expiring previous backups
