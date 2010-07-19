# EXECUTABLES
MYSQLDUMP_CMD = '/usr/bin/mysqldump'
MONGODUMP_CMD = '/usr/bin/mongodump'
GZIP_CMD = '/usr/bin/gzip'
TAR_CMD = '/usr/bin/tar'
CP_CMD = '/bin/cp'

# PATHS
TMP_BACKUP_PATH = 'temp' # Will be created (and removed) inside the directory where the script is installed

# use SSL to transmit backups to S3 (a good idea)
USE_SSL = true

# CREATE AWS/S3 CONNECTION
AWS::S3::Base.establish_connection!(
  :access_key_id  => '*** YOUR CREDENTIALS HERE ***',
  :secret_access_key => '*** YOUR CREDENTIALS HERE ***',
  :use_ssl => USE_SSL
)

# SPECIFY S3 BUCKET
S3_BUCKET = 'my.unique.name'

# SPECIFY HOW MANY DAYS OF ARCHIVES YOU WANT TO KEEP
DAYS_OF_ARCHIVES = 7

# MYSQL CONFIG
#  * Put the MySQL table names that you want to back up in the MYSQL_DBS array below
#    Archive will be named in the format: db-table_name-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
MYSQL_DBS = ['application_production', 'wordpress', 'something_else']
MYSQL_DB = 'localhost'
MYSQL_USER = 'XXXXX'
MYSQL_PASS = 'XXXXX'

# MONGODB CONFIG
#  * Put the MongoDB table names that you want to back up in the MONGO_DBS array below
#    Archive will be named in the format: mdb-table_name-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
MONGO_DBS = ['mongo_db_one', 'mongo_db_test']
MONGO_HOST = 'localhost'

# DIRECTORY BACKUP CONFIG
#  * Add hash pair for each directory you want to backup
#    in format: "name_for_backup" => "/actual/directory/name"
#    Archive will be named in the format: dir-name_for_backup-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
DIRECTORIES = {
  "important" => "/home/username/important",
  "apache_logs" => "/etc/apache2/logs"
}

# SINGLE FILES CONFIG
#  * Add hash pair for each grouping of single files you want to backup
#    in format: "name_for_backup" => [array of single files to backup]
#    Archive will be named in the format: files-name_for_backup-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
SINGLE_FILES = {
  'important_configs' => ['/etc/hosts', '/etc/my.cnf'],
  'other_configs' => ['/etc/syslog.conf', '/etc/smb.conf']
}
