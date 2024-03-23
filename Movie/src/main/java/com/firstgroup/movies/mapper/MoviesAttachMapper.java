package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.MoviesAttachVO;

@Mapper
public interface MoviesAttachMapper {
	
	public void insert(MoviesAttachVO vo); // create
	
	public void delete(String uuid); // delete
	
	public List<MoviesAttachVO> findBymovBno (Long bno); // select
}
