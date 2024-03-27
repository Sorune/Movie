package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.mapper.ImgMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class ImgServiceImpl implements ImgService {
	
	@Setter(onMethod_ = @Autowired)
	private ImgMapper mapper;

	@Override
	public ImgVO get(Long imgno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(String tblName, ImgVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String tblName, String uuid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<? extends ImgVO> findByBno(String tblName, Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<? extends ImgVO> commentList(String tblName, Long imgno) {
		// TODO Auto-generated method stub
		return null;
	}

}
