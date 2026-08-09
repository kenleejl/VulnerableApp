-- Level 1: SQL Injection
-- Real password: 'not_needed_for_sqli'
INSERT INTO auth_users VALUES (1, 'admin_sqli', 'not_needed_for_sqli', NULL, 'PLAIN', 1, 'admin_sqli@example.com', 'ADMIN');

-- Level 2: Sensitive Data Logging
-- Password is stored with BCrypt (cost 12); no plaintext credential is persisted or logged.
INSERT INTO auth_users VALUES (2, 'admin_logs', '$2b$12$V0LQXHleF9yk3daTGPr1bOsV5EM9sxJr.zrK.MLvPuj/9TiMUjjL2', NULL, 'BCRYPT', 2, 'admin_logs@example.com', 'ADMIN');

-- Level 3: Plaintext Storage
-- Replaced with a unique BCrypt hash (cost 12).
INSERT INTO auth_users VALUES (3, 'admin_plain', '$2b$12$Iy4/djqtmfGRNE3u29Md0uoa4HvTIO7bVL5nI45iSyptmxvNG4/wK', NULL, 'BCRYPT', 3, 'admin_plain@example.com', 'ADMIN');

-- Level 4: Replaced raw MD5 with a unique BCrypt hash (cost 12).
INSERT INTO auth_users VALUES (4, 'admin_md5', '$2b$12$bz04J4AP9DCGGCxnnAiNDeKxuDqC.J9AWMxMrCm72GLLdX4Q.RkJK', NULL, 'BCRYPT', 4, 'admin_md5@example.com', 'ADMIN');

-- Level 5: Replaced raw SHA-1 with a unique BCrypt hash (cost 12).
INSERT INTO auth_users VALUES (5, 'admin_sha1', '$2b$12$dyGeOTUYHE8WIfStgoLncu6OzZbp2j5Mg/mxE0LrLsxY.C1/Qz3Ha', NULL, 'BCRYPT', 5, 'admin_sha1@example.com', 'ADMIN');

-- Level 6: Replaced unsalted SHA-256 with a unique BCrypt hash (cost 12).
INSERT INTO auth_users VALUES (6, 'admin_sha256', '$2b$12$4dN8kBW5/uX0/RGFCZf45OmbnVsC4zb5ukj2dXaBQm/dnZ36lsGKm', NULL, 'BCRYPT', 6, 'admin_sha256@example.com', 'ADMIN');

-- Level 7: Salted SHA-256 (q1W%6nTp^8vM with Salt s9A#2zLk)
INSERT INTO auth_users VALUES (7, 'admin_enum', '71ad23cc508b5658f0bc21d8323f55521be98ca951e83a4a4d15641a3ca2b8a4', 's9A#2zLk', 'SHA256', 7, 'admin_enum@example.com', 'ADMIN');

-- Level 8: High-entropy password with a unique BCrypt hash (cost 12).
INSERT INTO auth_users VALUES (8, 'admin_weak', '$2b$12$7hLqUsl2AC/Hks4ceDQAguYSw04z8y0ZOsoFlaYpzPTJ6LKuBjqQ6', NULL, 'BCRYPT', 8, 'admin_weak@example.com', 'ADMIN');

-- Level 9: Secure (Bcrypt + Generic Error) (9fG#2hJk*LmN!8qR)
-- Bcrypt hash for '9fG#2hJk*LmN!8qR'
INSERT INTO auth_users VALUES (9, 'admin_secure', '$2a$10$1WiFUNqUY/vHTzR2QtuMQuzCLK3aZEdjEUpqS4msXOevaCz7Wobe.', NULL, 'BCRYPT', 9, 'admin_secure@example.com', 'ADMIN');

-- Level 10: BCrypt with a cost factor of 12 over the documented password ('sunshine').
-- Keeping the documented credential preserves the legitimate login path while the increased work
-- factor closes the low-iteration weakness this level demonstrates.
INSERT INTO auth_users VALUES (10, 'admin_lowcost', '$2a$12$yGgQPiIcqMffgCPgK3hfRecN2TjdBqkVcS6tD6adrc9hxmUo1GnW.', NULL, 'BCRYPT', 10, 'admin_lowcost@example.com', 'ADMIN');
