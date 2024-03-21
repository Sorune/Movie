package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;

public interface MoviesService {

	public MoviesVO get(Long movno);
	
	public List<MoviesCommentVO> commentList(Long movbno);
	
	public List<MemberVO> getCommentWriter(Long movbno); // 댓글 작성자 불러오기
}
