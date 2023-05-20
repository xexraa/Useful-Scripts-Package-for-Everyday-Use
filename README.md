# Useful Scripts Package for Everyday Use

This project contains several scripts that provide various functionalities for file management, system information, and network monitoring. Each script is described below.

## Table of Contents

- [Backup Script](#backup-script)
- [File Organizer](#file-organizer)
- [System Information](#system-information)
- [File Search](#file-search)
- [File Encryption](#file-encryption)
- [Bulk File Renamer](#bulk-file-renamer)
- [File Compression](#file-compression)
- [Disk Usage Analyzer](#disk-usage-analyzer)
- [Network Monitoring](#network-monitoring)

## Backup Script

A script that automates the process of backing up specific directories or files to a designated backup location.
**Example:** 'chmod +x backup_script.sh' './backup_script.sh test_file.txt location'


## File Organizer

A script that organizes files in a directory based on their extension, moving them to separate folders. For example, all `.txt` files will be moved to one folder, and all `.png` files will be moved to another folder.
**Example:** 'chmod +x file_organizer.sh' './file_organizer.sh /home/user/test_folder'


## System Information

A script that displays important system information such as CPU usage, memory usage, disk space, and network statistics.
**Example:** 'chmod +x system_info.sh' './system_info.sh'


## File Search

A script that allows you to search for files by name or extension within a specified directory or its subdirectories.
**Example:** 'chmod +x file_search.sh' './file_search.sh /home/user/test_folder log.txt'


## File Encryption

A script that encrypts files using a symmetric encryption algorithm (e.g., AES) and prompts for a password.
**Example:** 'chmod +x file_encryption.sh' './file_encryption.sh /home/user/log.txt logged.txt'


## Bulk File Renamer

A script that renames multiple files in a directory based on a specific pattern or search and replace rules.
**Example:** 'chmod +x bulk_file_renamer.sh' './bulk_file_renamer.sh /home/user/test_folder log.txt test.jpg'


## Disk Usage Analyzer

A script that analyzes disk usage and provides a report showing the largest files or directories on a system and it is possible to choose the number of views.
**Example:** 'chmod +x disk_usage_analyzer.sh' './disk_usage_analyzer.sh /home/user 10'


## Network Monitoring

A script that monitors network connectivity, checks for open ports, and generates alerts or notifications in case of issues.
**Example:** 'chmod +x network_monitoring.sh' './network_monitoring.sh'



**Note:** Make sure you have the necessary permissions and dependencies installed to run these scripts successfully.

