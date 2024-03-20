create table tbl_member(
	membno number(10) constraint mem_pk primary key,
	id nvarchar(20) not null unique,
	pw nvarchar(20) not null,
	name nvarchar(20) not null,
	nickname nvarchar(20),
	adress nvarchar(100) not null,
	phone nvarchar(13) not null,
	regdate date default sysdate,
	mem_imgno number(10)
);

create table tbl_member_img(
	imgno number(10) constraint mem_img_pk primary key,
	path nvarchar(20) not null,
	filename nvarchar(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	membno number(10)
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
	mov_imgno number(10)
);

create table tbl_movies_img(
	imgno number(10) constraint mov_img_pk primary key,
	path nvarchar(20) not null,
	filename nvarchar(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	movbno number(10)
);

create table tbl_actor(
	actbno number constraint act_pk primary key,
	name nvarchar(20) not null,
	age number(3) not null,
	b_date date default sysdate,
	d_date date,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate,
	act_imgno(10)
);

create table tbl_actor_img(
	imgno number(10) constraint act_img_pk primary key,
	path nvarchar(20) not null,
	filename nvarchar(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	actbno number(10)
);

create table tbl_director(
	actbno number constraint act_pk primary key,
	name nvarchar(20) not null,
	age number(3) not null,
	b_date date default sysdate,
	d_date date,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate,
	dir_imgno number(10)
);

create table tbl_director_img(
	imgno number(10) constraint dir_img_pk primary key,
	path nvarchar(20) not null,
	filename nvarchar(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	dirbno number(10)
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
