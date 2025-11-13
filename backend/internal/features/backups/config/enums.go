package backups_config

type BackupNotificationType string

const (
	NotificationBackupFailed  BackupNotificationType = "BACKUP_FAILED"
	NotificationBackupSuccess BackupNotificationType = "BACKUP_SUCCESS"
)

type BackupTool string

const (
	BackupToolPgDump       BackupTool = "PG_DUMP"
	BackupToolPgBasebackup BackupTool = "PG_BASEBACKUP"
)

func (t BackupTool) IsValid() bool {
	switch t {
	case BackupToolPgDump, BackupToolPgBasebackup:
		return true
	default:
		return false
	}
}
