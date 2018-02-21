create database if not exists mybooks character set utf8 collate utf8_unicode_ci;
use mybooks;

grant all privileges on mybooks.* to 'mybooks_user'@'localhost' identified by 'secret';
