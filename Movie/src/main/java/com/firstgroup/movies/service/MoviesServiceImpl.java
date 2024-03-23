package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.mapper.MoviesCommentMapper;
import com.firstgroup.movies.mapper.MoviesMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class MoviesServiceImpl implements MoviesService{

	@Setter(onMethod_ = @Autowired)
	private MoviesMapper movMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MoviesCommentMapper comMapper;
	
	@Override
	public MoviesVO get(Long movbno) {
		
		log.info("불러올 영화 식별 번호 : " + movbno);
		
		return movMapper.get(movbno);
	}

	
	@Override
	public List<MoviesCommentVO> commentList(Long movbno) {
		
		log.info("댓글리스트 불러오는 중......  ");
		
		return comMapper.commentList(movbno);
	}


	@Override
	public MoviesVO registerMovies(MoviesVO mov) {
		log.info("영화 등록...........");
		mov.setMovBno(movMapper.insertSelectKey(mov)); 
		
		return mov;
		
	}

	
	
	
}
