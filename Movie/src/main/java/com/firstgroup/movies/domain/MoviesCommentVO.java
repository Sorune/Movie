package com.firstgroup.movies.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MoviesCommentVO {

	private Long comBno;		// 댓글 식별번호
	private String content;		// 댓글 내용
	private Long memBno;		// 멤버 키
	private Long movBno;		// 영화 식별 키
	private int stars;			// 평점
	private int recommend;		// 추천수
	private Date regDate;		// 작성일
	private Date upDate;		// 수정일
	
}
