create sequence message_seq start with 1 increment by 50;
create sequence usr_seq start with 1 increment by 50;
create table message
(
    id       int8 primary key,
    user_id  int8,
    text     varchar(2048),
    filename varchar(255),
    tag      varchar(255)
);
create table user_role
(
    user_id int8 not null,
    roles   varchar(255) check (roles in ('USER', 'ADMIN'))
);
create table usr
(
    id              int8 primary key,
    active          boolean not null,
    activation_code varchar(255),
    email           varchar(255),
    password        varchar(255) not null,
    username        varchar(255) not null
);
alter table if exists message add constraint FK70bv6o4exfe3fbrho7nuotopf foreign key (user_id) references usr;
alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr;