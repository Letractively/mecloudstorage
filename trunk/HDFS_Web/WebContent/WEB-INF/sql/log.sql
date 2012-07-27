drop database if exists hdfs;
create database hdfs;

use hdfs;

#user table
create table user
(
	username varchar(20) primary key,
	password varchar(20) not null
) default charset=utf8;

#log table
create table log
(
	id int auto_increment primary key,
	username varchar(20) not null,
	optime datetime not null,
	action enum("upload", "download", "delete") not null,
	filename varchar(255) not null,
	pathname varchar(255) not null
) default charset=utf8;