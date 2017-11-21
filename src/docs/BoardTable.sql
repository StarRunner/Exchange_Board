drop table USER_T;
create table USER_T
(
       ID number(4),
       NAME varchar2(20),
	   E_MAIL varchar2(20),
	   PROJECT_ID varchar2(2),
       PROJECT_NAME varchar2(20)   
);
drop sequence USER_ID;
create sequence USER_ID
minvalue 1
maxvalue 9999
start with 1
increment by 1
cache 20;
--------------------------------------------
drop table CONTENT_T;
create table CONTENT_T
(
       ID number(8),
	   AUTHER_ID number(4),
       TITLE varchar2(100),
	   SUBTITLE varchar2(100),
	   CONTENT varchar2(1000),
	   SOURCE_LINK varchar2(10000),
	   IMG_FOLDER varchar2(100),
	   IMG_NAME varchar2(100),
	   TAG_ID number(4)
);
drop sequence CONTENT_ID;
create sequence CONTENT_ID
minvalue 1
maxvalue 999999
start with 1
increment by 1
cache 20;

--------------------------------------------
drop table TAG_T;
create table TAG_T
(
       ID number(8),
       TAG_NAME varchar2(100)
);
drop sequence TAG_ID;
create sequence TAG_ID
minvalue 1
maxvalue 999999
start with 1
increment by 1
cache 20;

--------------------------------------------



