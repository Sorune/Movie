package com.firstgroup.movies.domain;

import lombok.Data;
import oracle.sql.DATE;


@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String adress;
	private String phone;
	private DATE regdate;
	private Long mem_imgno;
	
	

}
