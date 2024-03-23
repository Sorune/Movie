package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;

@Mapper
public interface MoviesMapper {

	
	public MoviesVO get(Long movBno); // get방식으로 영화 식별 번호를 받아 객체를 리턴
	
	public void insert(MoviesVO vo);
	
	public Long insertSelectKey(MoviesVO vo);
	
	public List<MoviesCommentVO> getList(); // 댓글 객체를 리스트에 담아 리턴
}
