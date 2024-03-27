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
		mov.setMovBno(movMapper.insertSelectKey(mov)); 
		
		return mov;
		
	}


	@Override
	public List<MoviesCommentVO> getCommentList(Long movbno, Criteria cri) {
		
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

//	public int remove(Long rno) {
//		log.info("삭제 할 댓글 번호 : "+ rno);
//		
//		ReplyVO vo = mapper.read(rno); // 삭제 할 댓글의 번호를 불러옴
//		
//		boardMapper.updateReplyCnt(vo.getBno(), -1); // 가져온 게시물의 댓글 카운트를 -1
//		
//		return mapper.delete(rno);
//	}

//	@Override
//	public List<MoviesCommentVO> getList(Criteria cri, Long bno) {
//		return null;
//	}
//
//
//	@Override
//	public CommentPageDTO getListPage(Criteria cri, Long bno) {
//		return null;
//	}




	
	
	
}
