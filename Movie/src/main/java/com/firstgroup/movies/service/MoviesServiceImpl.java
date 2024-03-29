package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.mapper.MemberMapper;
import com.firstgroup.movies.mapper.MoviesCommentMapper;
import com.firstgroup.movies.mapper.MoviesMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@NoArgsConstructor
public class MoviesServiceImpl implements MoviesService{

	@Setter(onMethod_ = @Autowired)
	private MoviesMapper movMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MoviesCommentMapper comMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memMapper;
	
	@Override
	public MoviesVO get(Long movbno) {
		
		log.info("불러올 영화 식별 번호 : " + movbno);
		
		MoviesVO vo = movMapper.get(movbno);
		vo.setComment(comMapper.getCommentList(movbno));
		
		return vo;
	}


	@Override
	public int insertComment(MoviesCommentVO vo) {

		log.info("들어온 객체 확인========"+vo);
		int result = comMapper.insertComment(vo);
		return result;
	}


	@Override
	public MoviesVO registerMovies(MoviesVO mov) {
		log.info("영화 등록...........");
		//mov.setMovBno(movMapper.insertSelectKey(mov)); 
		movMapper.insert(mov);
		return mov;
		
	}


	@Override
	public List<MoviesCommentVO> getCommentList(Long movbno) {
		
		return comMapper.getCommentList(movbno);
	}


	@Override
	public int removeComment(Long combno) {
		
		MoviesCommentVO vo = comMapper.getComment(combno);
		
		return comMapper.removeComment(vo.getComBno());
		
	}


	@Override
	public MoviesCommentVO getComment(Long combno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<MoviesVO> getMovieList() {
		//전체 영화 리스트 출력
		return movMapper.getMovieList();
	}

	
}
