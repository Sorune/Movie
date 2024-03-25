package com.firstgroup.movies.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.service.MoviesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class MoviesController {

	private MoviesService movService; // 영화 정보
	
	
	@GetMapping("/getMovie")
	public void get(@RequestParam("movbno") Long movbno, Model model) {

		log.info("get.........");
		model.addAttribute("movie", movService.get(movbno));
		
		List<MoviesCommentVO> commentsList = movService.getCommentList(movbno);
		log.info("불러온 값 : "+ commentsList);
		model.addAttribute("comments", commentsList);
		
	}
	
	@PostMapping("/regComment")
	public String insertComment(MoviesCommentVO vo, RedirectAttributes rttr, Long movbno) {
		
		log.info("댓글 작성 중 =========" + vo.getMemBno());
		log.info("댓글 작성 중  movBno=========" + vo.getMovBno());
		log.info("댓글 작성 중  Stars=========" + vo.getStars());
		
		movService.insertComment(vo);
		
		return  "redirect:/getMovie?movbno="+vo.getMovBno();
	}
	
	@DeleteMapping(value = "/{combno}", produces = {MediaType.TEXT_PLAIN_VALUE,})	
	public ResponseEntity<String> remove(@RequestBody MoviesCommentVO vo, @PathVariable("combno") Long combno){
		
		log.info(combno);
		
		return movService.removeComment(combno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	
}
