import type { Period } from '../../databases/model/Period';
import type { Interval } from '../../intervals';
import type { Storage } from '../../storages';
import type { BackupNotificationType } from './BackupNotificationType';
import { BackupTool } from './BackupTool';

export interface BackupConfig {
  databaseId: string;

  isBackupsEnabled: boolean;
  storePeriod: Period;
  backupTool: BackupTool;
  backupInterval?: Interval;
  storage?: Storage;
  sendNotificationsOn: BackupNotificationType[];
  cpuCount: number;
  isRetryIfFailed: boolean;
  maxFailedTriesCount: number;
}
