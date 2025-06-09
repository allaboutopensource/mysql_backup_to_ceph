#MySQL Backup to Ceph via S3 – Bash Automation Script

This project provides a Bash script that automates the process of backing up a MySQL database, compressing the backup into a .tar.gz archive, and uploading it to a Ceph Object Gateway using S3-compatible API calls. It's designed for easy integration into cron jobs or other automated workflows for secure and efficient backup management.

# 🛠️ MySQL Backup to Ceph via S3 – Bash Automation Script

This project provides a Bash script that automates the process of backing up a MySQL database, compressing the backup into a `.tar.gz` archive, and uploading it to a Ceph Object Gateway using S3-compatible API calls.

## 📋 Features

- Automated MySQL database dump
- Compression of backup files using `tar` and `gzip`
- Upload to Ceph Object Gateway using AWS CLI or compatible tools
- Easy integration with cron jobs for scheduled backups

## 🚀 Requirements

- Bash shell
- `mysqldump` utility
- `tar` and `gzip`
- AWS CLI configured for Ceph RGW access
- Network access to Ceph Object Gateway

## ⚙️ Configuration

Update the script with the following variables:

- `DB_NAME`: Name of the MySQL database
- `DB_USER`: MySQL username
- `DB_PASSWORD`: MySQL password
- `BACKUP_DIR`: Directory to store the backup
- `BUCKET_NAME`: Ceph bucket name
- `ceph_ENDPOINT`: Ceph RGW endpoint URL
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`: Credentials for S3 access

## 🧪 Usage

1. Make the script executable:

   ```bash
   chmod +x mysql_backup_to_ceph.sh
   ```
