package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.DirectorVO;
import com.firstgroup.movies.mapper.DirectorMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class DirectorServiceImpl implements DirectorService{

	@Setter(onMethod_ = @Autowired)
	private DirectorMapper mapper;
	
	@Override
	public DirectorVO get(Long dirbno) {
		log.info("불러올 감독 번호 : " + dirbno);
		return mapper.getDirector(dirbno);
	}

	@Override
	public List<DirectorVO> directorList() {
		log.info("감독 목록 전체 출력...........");
		return mapper.getDirectorList();
	}

	@Override
	public void insertDirector(DirectorVO vo) {
		
		log.info("감독 등록...........");
		log.info("감독 정보 : "+ vo);
		
		mapper.insertDirector(vo);
	}

	@Override
	public boolean modify(DirectorVO vo) {
		log.info("수정할 감독 번호 : " + vo);
		return mapper.modify(vo);
	}
	
	@Override
	public boolean remove(Long dirbno) {
		log.info("삭제할 감독 번호 : " + dirbno);
		return mapper.remove(dirbno);
	}

}
