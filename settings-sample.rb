# EXECUTABLES
MYSQLDUMP_CMD = '/usr/bin/mysqldump'
GZIP_CMD = '/usr/bin/gzip'
TAR_CMD = '/usr/bin/tar'

# PATHS
TMP_BACKUP_PATH = 'temp' # Will be created (and removed) inside the directory where the script is installed

# CREATE AWS/S3 CONNECTION
AWS::S3::Base.establish_connection!(
  :access_key_id  => 'XXXXX',
  :secret_access_key => 'XXXXX'
)

# SPECIFY S3 BUCKET
S3_BUCKET = 'my.unique.name'

# MYSQL CONFIG
MYSQL_DBS = ['application_production', 'wordpress', 'something_else']
MYSQL_DB = 'localhost'
MYSQL_USER = 'XXXXX'
MYSQL_PASS = 'XXXXX'

# DIRECTORY BACKUP CONFIG
#  * Add hash pair for each directory you want to backup
#    in format: "/actual/directory/name" => "name_for_filename"
DIRECTORIES = {
  "/home/username/important" => "important",
  "/etc/apache2/logs" => "apache_logs"
}
