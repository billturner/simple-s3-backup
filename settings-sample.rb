# EXECUTABLES
MYSQLDUMP_CMD = '/usr/bin/mysqldump'
GZIP_CMD = '/usr/bin/gzip'

# PATHS
USER_PATH = '/home/username'
TMP_BACKUP_PATH = 'simple_s3_backup_tmp'

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
