CREATE TABLE message (id INTEGER PRIMARY KEY AUTOINCREMENT, subject VARCHAR(100), body LONGTEXT, recipient_id INTEGER, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
CREATE TABLE sf_guard_group (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(255) UNIQUE, description VARCHAR(1000), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
CREATE TABLE sf_guard_group_permission (group_id INTEGER, permission_id INTEGER, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id));
CREATE TABLE sf_guard_permission (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(255) UNIQUE, description VARCHAR(1000), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
CREATE TABLE sf_guard_remember_key (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
CREATE TABLE sf_guard_user (id INTEGER PRIMARY KEY AUTOINCREMENT, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active INTEGER DEFAULT '1', is_super_admin INTEGER DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
CREATE TABLE sf_guard_user_group (user_id INTEGER, group_id INTEGER, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id));
CREATE TABLE sf_guard_user_permission (user_id INTEGER, permission_id INTEGER, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id));
CREATE INDEX is_active_idx_idx ON sf_guard_user (is_active);
