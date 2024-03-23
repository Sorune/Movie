package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.ImgVO;

public interface ImgService {
	public ImgVO get(Long imgno);
	
	public void insert(String tblName, ImgVO vo); // create
	
	public void delete(String tblName, String uuid); // delete
	
	public List<? extends ImgVO>  findByBno(String tblName, Long bno); // select
	
	public List<? extends ImgVO> commentList(String tblName, Long imgno);
}
