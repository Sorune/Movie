package com.firstgroup.movies.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.domain.MoviesAttachVO;

@Mapper
public interface ImgMapper {
	
	public ImgVO getImg(Map<String, Object> data);
	
	public void insert(ImgVO vo); // create
	
	public void delete(Map<String, Object> data); // delete
	
	public List<MoviesAttachVO> findByBno (Map<String, Object> data); // select
}
