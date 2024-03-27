package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;

public interface MoviesService {

	public MoviesVO get(Long movno);
	
	public List<MoviesVO> getMovieList();
	
	public MoviesCommentVO getComment(Long combno);
	
	public MoviesVO registerMovies(MoviesVO mov);
	
	public int insertComment(MoviesCommentVO vo);
	
	public List<MoviesCommentVO> getCommentList(Long movbno); // 댓글 작성자 불러오기
	
	public int removeComment(Long combno);
	
	public int like(Long combno);
	
	//public List<MoviesCommentVO> getList(Criteria cri, Long bno);
	
	//public CommentPageDTO getListPage(Criteria cri, Long bno);
}
