package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.DirectorVO;

public interface DirectorService {

	public DirectorVO get(Long dBno); // r - only one
	
	public List<DirectorVO> directorList(); // r - total
	
	public void insertDirector(DirectorVO vo); // c
	
	public boolean modify(DirectorVO vo); // u - director
	
	public  boolean remove(Long dirbno); // d - director
	
}
