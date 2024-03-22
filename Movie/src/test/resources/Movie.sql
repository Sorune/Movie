--계정 생성--
create user movies identified by movies;

grant connect, dba to movies;
-----------------------------------------------------------------------
create table tbl_member(
	membno number(10),
	id nvarchar2(20) not null,
	pw nvarchar2(20) not null,
	name nvarchar2(20) not null,
	nickname nvarchar2(20),
	adress nvarchar2(100) not null,
	phone nvarchar2(13) not null,
	regdate date default sysdate,
	mem_imgno number(10),
	constraint mem_pk primary key(membno),
	CONSTRAINT id_uq UNIQUE(id) 
);

drop table tbl_member;
	create sequence seq_member ;
create table tbl_member_auth (
     id nvarchar2(20) not null,
     auth nvarchar2(20) not null,
     constraint fk_member_auth foreign key(id) references tbl_member(id)
);

ALTER TABLE tbl_member RENAME COLUMN id TO username;
alter table tbl_member rename column pw to password;
ALTER TABLE tbl_member RENAME COLUMN username TO id;
alter table tbl_member rename column password to pw;

ALTER TABLE tbl_member MODIFY enabled char(1);

ALTER TABLE tbl_member ADD enabled VARCHAR(1) DEFAULT '1' NOT NULL;
ALTER TABLE tbl_member modify pw nvarchar2(100);
update tbl_member set enabled='1';

select * from tbl_member;

select id , pw from tbl_member where id = 'kkk';

alter table tbl_member_auth rename column id to username;
alter table tbl_member_auth rename column username to id;

select * from tbl_member_auth;

insert into tbl_member_auth values('sss','ROLE_ADMIN');

	SELECT 
  mem.id,pw, name,nickname,adress,phone,regdate, mem_imgno
FROM 
  tbl_member mem LEFT OUTER JOIN tbl_member_auth auth on mem.id = auth.id 
WHERE mem.id = ('kkk'); 
	
	
	insert into tbl_member (membno, id , pw , name,nickname,adress,phone) 
	values (seq_member.nextval ,'kkk' , 'kkk' , 'ksk','월','수원시','01011111111');
	
	insert into tbl_member (membno, id , pw , name,nickname,adress,phone) 
	values (seq_member.nextval ,'sss' , 'sss' , 'sss','월','수원시','01011111112');
	insert into tbl_member (membno, id , pw , name,nickname,adress,phone)  
	values (seq_member.nextval ,'lll' , 'lll' , 'lll','월','수원시','01011111113');
	
	insert into tbl_member (membno, id , pw , name,nickname,adress,phone) 
	values (seq_member.nextval ,'aaa' , 'aaa' , 'aaa','월','수원시','01011111114');
	
select * from TBL_MEMBER;
drop table TBL_MEMBER; 



create table tbl_member_img(
	imgno number(10) constraint mem_img_pk primary key,
	path nvarchar2(20) not null,
	filename nvarchar2(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	membno number(10)
);

create table tbl_movies(
	movbno number(10) constraint mov_pk primary key,
	title nvarchar2(100) not null,
	content nvarchar2(1000) not null,
	director nvarchar2(20) not null,
	actor nvarchar2(500) not null,
	stars_avg number(1) default 0,
	recommend number(5) default 0,
	created_date date default sysdate,
	regdate date default sysdate,
	up_date date default sysdate,
	mov_imgno number(10)
);

create table tbl_movies_img(
	imgno number(10) constraint mov_img_pk primary key,
	path nvarchar2(20) not null,
	filename nvarchar2(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	movbno number(10)
);

create table tbl_actor(
	actbno number constraint act_pk primary key,
	name nvarchar2(20) not null,
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
	path nvarchar2(20) not null,
	filename nvarchar2(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	actbno number(10)
);

create table tbl_director(
	actbno number constraint act_pk primary key,
	name nvarchar2(20) not null,
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
	path nvarchar2(20) not null,
	filename nvarchar2(50) not null,
	regdate date default sysdate,
	up_date date default sysdate,
	dirbno number(10)
);

create table tbl_movies_comment(
	combno number(10) constraint com_pk primary key,
	content nvarchar2(200) not null,
	membno number(10),
	movbno number(10),
	stars number(1) default 0,
	recommend number(5) default 0,
	regdate date default sysdate,
	up_date date default sysdate
);



create table tbl_movies(
   movbno number(10) constraint mov_pk primary key,
   title nvarchar2(100) not null,
   content nvarchar2(1000) not null,
   director nvarchar2(20) not null,
   actor nvarchar2(500) not null,
   stars_avg number(1) default 0,
   recommend number(5) default 0,
   created_date date default sysdate,
   regdate date default sysdate,
   up_date date default sysdate,
   mov_imgno number(10)
);

drop table tbl_movies;

create sequence seq_movies;

select * from TBL_MOVIES;

---------------------------------------------------------


-- membno를 조건으로 comment및 회원 정보 불러오기
select * from tbl_movies_comment, tbl_member where tbl_movies_comment.membno = tbl_member.membno and tbl_movies_comment.membno = 1;

select * from tbl_movies_comment;
  

insert into tbl_movies_comment(combno, content, membno, movbno, stars, recommend) values(8, '휴지가 어딨더라....?', 2, 21, 5, 1);
insert into tbl_movies_comment(combno, content, membno, movbno, stars, recommend) values(9, '아주 재미지구나!!!', 2, 21, 5, 1);

create table tbl_movies_comment(
   combno number(10) constraint com_pk primary key,
   content nvarchar2(200) not null,
   membno number(10),
   movbno number(10),
   stars number(1) default 0,
   recommend number(5) default 0,
   regdate date default sysdate,
   up_date date default sysdate
);

select * from tbl_movies_comment;


-- 멤버테이블과 연결
alter table tbl_movies_comment add constraint comment_mem_fk foreign key(membno) references tbl_member(membno); 
-- 영화 테이블과 연결
alter table tbl_movies_comment add constraint comment_mem_fk foreign key(membno) references tbl_member(membno); 
-------------------------------------------------------------
drop table tbl_member;

create table tbl_member(
   membno 	number(10) constraint mem_pk primary key,
   id 		nvarchar2(20) not null unique,
   pw 		nvarchar2(20) not null,
   name 	nvarchar2(20) not null,
   nickname nvarchar2(20),
   adress 	nvarchar2(100) not null,
   phone 	nvarchar2(13) not null,
   regdate 	date default sysdate,
   mem_imgno number(10)
);

insert into tbl_member(membno, id, pw, name, nickname, adress, phone) values(1, 'ozo', '111', '양지웅', '양지', '용인', '010-1234-5678');
insert into tbl_member(membno, id, pw, name, nickname, adress, phone) values(2, 'lee', '111', '서준리', '서즁찌', '오산', '010-2222-5678');


drop table TBL_MEMBER_AUTH;
drop table mov_member;
drop table tbl_attach;
drop table TBL_REPLY;
drop table TBL_board;
drop table TBL_MEMBER;


