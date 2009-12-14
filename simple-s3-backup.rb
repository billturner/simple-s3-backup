#/usr/bin/env ruby

%w(rubygems aws/s3 fileutils).each do |lib|
  require lib
end
include AWS::S3

require 'settings'

# Initial setup
timestamp = Time.now.strftime("%Y%m%d-%H%M")
full_tmp_path = File.join(File.dirname(__FILE__), TMP_BACKUP_PATH)

# Find/create the backup bucket
if Service.buckets.collect{ |b| b.name }.include?(S3_BUCKET)
  bucket = Bucket.find(S3_BUCKET)
else
  begin
    bucket = Bucket.create(S3_BUCKET)
  rescue Exception => e
    puts "There was a problem creating the bucket: #{e.message}"
    exit
  end
end

# Create tmp directory
FileUtils.mkdir_p full_tmp_path

# Perform MySQL backups
if MYSQL_DBS && MYSQL_DBS.length > 0
  MYSQL_DBS.each do |db|
    db_filename = "db-#{db}-#{timestamp}.gz"
    system("#{MYSQLDUMP_CMD} -u #{MYSQL_USER} -p#{MYSQL_PASS} --single-transaction --add-drop-table --add-locks --create-options --disable-keys --extended-insert --quick #{db} | #{GZIP_CMD} -c > #{full_tmp_path}/#{db_filename}")
    S3Object.store(db_filename, open("#{full_tmp_path}/#{db_filename}"), S3_BUCKET)
  end
end

# Perform directory backups
if DIRECTORIES && DIRECTORIES.length > 0
  DIRECTORIES.each do |name,dir|
    dir_filename = "dir-#{dir}-#{timestamp}.tgz"
    system("cd #{dir} && #{TAR_CMD} -czf #{full_tmp_path}/#{dir_filename} .")
    S3Object.store(dir_filename, open("#{full_tmp_path}/#{dir_filename}"), S3_BUCKET)
  end
end

# Perform single files backups
if SINGLE_FILES && SINGLE_FILES.length > 0
  SINGLE_FILES.each do |name,files|

    # Create a directory to collect the files
    files_tmp_path = File.join(full_tmp_path, "#{name}-tmp")
    FileUtils.mkdir_p files_tmp_path

    # Filename for files
    files_filename = "files-#{name}-#{timestamp}.tgz"

    # Copy files to temp directory
    files.each do |file|
      system("#{CP_CMD} #{file} #{files_tmp_path}")
    end

    # Create archive & copy to S3
    system("cd #{files_tmp_path} && #{TAR_CMD} -czf #{full_tmp_path}/#{files_filename} .")
    S3Object.store(files_filename, open("#{full_tmp_path}/#{files_filename}"), S3_BUCKET)

    # Remove the temporary directory for the files
    FileUtils.remove_dir files_tmp_path
  end
end

# Finally, remove tmp directory
FileUtils.remove_dir full_tmp_path
