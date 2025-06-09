#!/bin/bash

# Configuration
USER="devops"
PASSWORD="devops@123"
DATABASE="omysqlDB"
BACKUP_DIR="mysql_backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/${DATABASE}_backup_$DATE.sql"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
TAR_NAME="mysql_backup_$TIMESTAMP.tar.gz"
BUCKET_NAME="mysql-backup"
CEPH_ENDPOINT="http://ceph-node-01:80"
OBJECT_KEY="$TAR_NAME"

mkdir $BACKUP_DIR
# Run the backup
mysqldump -u "$USER" -p"$PASSWORD" "$DATABASE" > "$BACKUP_FILE"
echo "[*] Creating TAR archive..."
tar -czvf "$TAR_NAME" "$BACKUP_FILE"
# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "✅ Backup successful: $BACKUP_FILE"
else
  echo "❌ Backup failed!"
fi

/usr/local/bin/aws s3api put-object --bucket "$BUCKET_NAME" --key "$OBJECT_KEY" --body "$TAR_NAME" --endpoint-url "$CEPH_ENDPOINT" --profile ceph
echo "[✓] Upload complete: $OBJECT_KEY"
