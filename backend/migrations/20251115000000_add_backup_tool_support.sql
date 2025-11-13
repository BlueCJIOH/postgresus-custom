-- +goose Up
-- +goose StatementBegin
ALTER TABLE backup_configs
    ADD COLUMN IF NOT EXISTS backup_tool TEXT NOT NULL DEFAULT 'PG_DUMP';

ALTER TABLE backups
    ADD COLUMN IF NOT EXISTS backup_tool TEXT NOT NULL DEFAULT 'PG_DUMP';
-- +goose StatementEnd

-- +goose StatementBegin
-- Ensure existing records have the new value set explicitly
UPDATE backup_configs SET backup_tool = 'PG_DUMP' WHERE backup_tool IS NULL;
UPDATE backups SET backup_tool = 'PG_DUMP' WHERE backup_tool IS NULL;
-- +goose StatementEnd

-- +goose StatementBegin
-- Drop defaults now that data has been backfilled
ALTER TABLE backup_configs ALTER COLUMN backup_tool DROP DEFAULT;
ALTER TABLE backups ALTER COLUMN backup_tool DROP DEFAULT;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
ALTER TABLE backups DROP COLUMN IF EXISTS backup_tool;
ALTER TABLE backup_configs DROP COLUMN IF EXISTS backup_tool;
-- +goose StatementEnd
