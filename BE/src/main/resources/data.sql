INSERT INTO `user` (id, name, password) VALUES ('vans', '반스', '1111');
INSERT INTO column (id, name) VALUES (1, 'to do');
INSERT INTO column (id, name) VALUES (2, 'in progress');
INSERT INTO card (user_id, column_id, subject, contents, create_time, update_time) VALUES ('vans', 1, '할일', '본문1', '2022-04-06 16:00:00', '2022-04-06 16:00:00');
INSERT INTO card (user_id, column_id, subject, contents, create_time, update_time) VALUES ('vans', 2, '하는중', '본문2', '2022-04-06 16:00:00', '2022-04-06 16:00:00');
