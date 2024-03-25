package com.firstgroup.movies.domain;

import java.util.List;

import lombok.Data;

@Data
public class ActorVO {
	private long actbno;
	private String name;
	private int age;
	
	private List<ImgVO> imgList;
}
