package com.firstgroup.movies.mapper;

import java.util.List;

import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;

public interface MoviesCommentMapper {

	public List<MoviesCommentVO> commentList(Long movbno);
	
	public List<MemberVO> getCommentWriter(Long movbno);
	
}
