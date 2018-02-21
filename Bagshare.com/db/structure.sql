drop table if exists book;
drop table if exists author;

create table author (
    auth_id integer not null primary key auto_increment,
    auth_first_name varchar(100) not null,
    auth_last_name varchar(100) not null
) engine=innodb character set utf8 collate utf8_unicode_ci;

create table book (
    book_id integer not null primary key auto_increment,
    book_title varchar(100) not null,
    book_isbn varchar(13) not null,
    book_summary varchar(2000) not null,
    auth_id integer not null,
    constraint fk_book_auth foreign key(auth_id) references author(auth_id)
) engine=innodb character set utf8 collate utf8_unicode_ci;
