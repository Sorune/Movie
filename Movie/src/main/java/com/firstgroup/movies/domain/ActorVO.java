package com.firstgroup.movies.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ActorVO {
	private long actbno;
	private String name;
	private int age;
	private Date bDate;
	private Date dDate;
	private List<ImgVO> imgList;
}
