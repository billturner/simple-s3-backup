Simple S3 Backup
----------------

A simple Ruby script to back up MySQL database tables, MongoDB databases, full directories, and groups of single files to Amazon S3 (Simple Storage Service).

**Steps for using:**

1. Set up an Amazon S3 account: <http://aws.amazon.com/s3/>
2. Install the aws/s3 Ruby gem: <http://amazon.rubyforge.org/>
3. Rename settings-sample.rb to settings.rb
4. In settings.rb, fill in specific command paths, your Amazon API credentials, MySQL login info & databases, and any directories you want backed up.  Just comment out the constants for backups you don't want to run.
5. Set the script to run with cron - I have mine run every night, like so:

`15 3 * * * /usr/bin/ruby /home/username/backups/simple-s3-backup.rb`

**To do:**

1. Split daily archives into separate directories in the bucket? Would be helpful for those with lots of files, and lots of days
