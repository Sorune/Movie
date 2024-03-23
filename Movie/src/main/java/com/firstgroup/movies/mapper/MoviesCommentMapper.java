package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.MoviesCommentVO;

@Mapper
public interface MoviesCommentMapper {

	public List<MoviesCommentVO> commentList(Long movbno);
	
}
