package com.firstgroup.movies.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MoviesVO {

	private Long movBno;			// 영화 식별번호
	private String title;			// 영화 제목
	private String content;			// 영화 설명
	private double starsAvg;		// 평균별점
	private Date createDate;		// 영화 개봉일
	private Date regDate;			// 게시물 작성일
	private Date update;			// 게시물 업데이트 일자
	private int recommend;			// 추천수
	private Long  movImgNo;			// 영화 포스터 식별번호
	
	private List<MoviesCommentVO> comment;
	
	private String actListString; 	//배우 배열 파싱용
	private List<ActorVO> actList;	//배우 배열
	
	private String dirListString;	//감독 배열 파싱용
	private List<DirectorVO> dirList;//감독 배열
	
	private List<ImgVO> imgList;
	
}
