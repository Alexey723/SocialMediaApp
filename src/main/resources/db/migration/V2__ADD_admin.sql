insert into usr (id, username, password, active, email)
values (0, 'admin', '123', true, 'some@some.com');

insert into user_role (user_id, roles)
values (0, 'USER'), (0, 'ADMIN');