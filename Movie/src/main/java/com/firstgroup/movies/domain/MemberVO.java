package com.firstgroup.movies.domain;

import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {
	
	private int membno;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String adress;
	private String phone;
	private Date regdate;
	private Long mem_imgno;
	
	

}