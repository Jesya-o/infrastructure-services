# Backup Approach Documentation

This document provides an overview of the backup approach for the following components:

- Database Servers
    - Database Data: All databases and associated data files.
    - Database Configuration: Configuration files and settings.
    - Logs: Database server logs to assist in troubleshooting.
- InfluxDB
    - InfluxDB Data: All InfluxDB databases and data points.
    - Configuration: InfluxDB configuration files.
- Ansible Repository
    - Playbook: Ansible playbook and associated files.
    - Inventory: Ansible inventory file.
    - Configuration: Ansible configuration files and settings.

## Backup coverage

### Database Servers: Agama app MySQL database
- Daily backups of MySQL databases are conducted to ensure data integrity and availability.

### InfluxDB
- InfluxDB databases are backed up daily, providing redundancy and resilience against data loss.

### Ansible Repository
- Ansible repository is version-controlled using Git. While it is not traditionally considered part of a backup strategy, it allows changes to be tracked and previous versions to be recovered.

## Recovery Point Objective (RPO)

The RPO for the database servers is set at 1 hour. This means that, in the event of a failure, we aim to recover data up to the last one hour before the failure occurred.

### Database Servers
- For MySQL databases, full backups are made weekly, on Monday at 16:10 UTC.
- Incremental backups are taken daily at 16:10 UTC from Tuesday through Sunday.

### InfluxDB
- For MySQL databases, full backups are made weekly, on Monday at 16:10 UTC.
- Incremental backups are taken daily at 16:10 UTC from Tuesday through Sunday.

## Versioning and retention
Infrastructure playbook is versioned with git. Any version can be viewed at any time unless manually deleted.

## Usability checks
Usability checks ensure that backups are reliable and can be effectively restored.

- Automatic backup integrity checks to ensure data consistency.
- Manual restoration testing at least once a month to verify that backups can be successfully restored.

## Restoration criteria
Backups should be restored in the following scenarios:

- Data corruption or loss.
- Accidental data deletion.
- Critical system failures that impact database integrity.

## RTO (Recovery time objective):

The RTO for the database servers is set at 4 hours. This means that, in the event of a failure, we aim to have the system and data restored within 4 hours.
