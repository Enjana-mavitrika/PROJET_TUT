create database if not exists bagshare character set utf8 collate utf8_unicode_ci;

use bagshare;

grant all privileges on bagshare.* to 'nerd'@'localhost' identified by 'nerd';
