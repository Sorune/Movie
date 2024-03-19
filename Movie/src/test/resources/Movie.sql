create table tbl_member(
	membno number(10) constraint mem_pk primary key,
	id nvarchar(20) not null unique,
	pw nvarchar(20) not null,
	name nvarchar(20) not null,
	nickname nvarchar(20),
	adress nvarchar(100) not null,
	phone nvarchar(13) not null,
	regdate date default sysdate
);

create table tbl_movies(
	movbno number(10) constraint mov_pk primary key,
	title nvarchar(100) not null,
	content nvarchar(1000) not null,
	director nvarchar(20) not null,
	actor nvarchar(500) not null,
	stars_avg number(1) default 0,
	recommend number(5) default 0,
	created_date date default sysdate,
	regdate date default sysdate,
	up_date date default sysdate,
	imgno number(10)
);

create table tbl_movies_comment(
	combno number(10) constraint com_pk primary key,
	content nvarchar(200) not null,
	membno number(10),
	movbno number(10),
	stars number(1) default 0,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate
);

create table tbl_movies_img(
	imgno number(10) constraint img_pk primary key,
	path nvarchar(20) not null,
	filename nvarchar(50) not null,
	regdate date default sysdate,
	up_date date default sysdate
);