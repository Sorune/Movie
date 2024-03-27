package com.firstgroup.movies.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.MemberService;
import com.firstgroup.movies.service.MoviesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class MoviesController {

	private MoviesService movService; // 영화 정보
	
	private MemberService memService; // 유저 정보
	

	@DeleteMapping(value = "/{combno}", produces = {MediaType.TEXT_PLAIN_VALUE,})	
	public ResponseEntity<String> remove(@RequestBody MoviesCommentVO vo, @PathVariable("combno") Long combno){
		
		log.info(combno);
		
		return movService.removeComment(combno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	
	
	@PostMapping(value = "/regComment", produces = MediaType.TEXT_PLAIN_VALUE) 
	public ResponseEntity<String> insertComment(MoviesCommentVO vo) {
		
		
		log.info("---------------댓글 작성 객체 확인 : "+vo.getContent());
		log.info("---------------댓글 작성 객체 확인 : "+vo.getMemBno());
		log.info("---------------댓글 작성 객체 확인 : "+vo.getMovBno());
		log.info("---------------댓글 작성 객체 확인 : "+vo.getStars());

		return movService.insertComment(vo) == 1? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
	
	// jsp 파일 업로드용 매핑
	@GetMapping(value="/getMovie/{movbno}")
	public ModelAndView getMovie(@PathVariable Long movbno, Model model){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/getMovie");
		mv.addObject("movie", movService.get(movbno));
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info(user);
		MemberVO member = user.getMember();
		log.info(member);
		String id = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
		log.info(id);
		log.info(model);
		MemberVO memVo = memService.getMember(member.getId());
		log.info(memVo);
		model.addAttribute("user", memVo);
		return mv;
	}
	
	/*
	 * @GetMapping("/getMovie") public void get(@RequestParam("movbno") Long movbno,
	 * Model model) {
	 * 
	 * log.info("get........."); model.addAttribute("movie",
	 * movService.get(movbno));
	 * 
	 * List<MoviesCommentVO> commentsList = movService.getCommentList(movbno);
	 * log.info("불러온 값 : "+ commentsList); model.addAttribute("comments",
	 * commentsList);
	 * 
	 * }
	 */
	
	
	/*
	 * @PostMapping("/regComment") public String insertComment(MoviesCommentVO vo,
	 * RedirectAttributes rttr, Long movbno) {
	 * 
	 * log.info("댓글 작성 중 =========" + vo.getMemBno());
	 * log.info("댓글 작성 중  movBno=========" + vo.getMovBno());
	 * log.info("댓글 작성 중  Stars=========" + vo.getStars());
	 * 
	 * movService.insertComment(vo);
	 * 
	 * return "redirect:/getMovie?movbno="+vo.getMovBno(); }
	 * 
	 */
	
	
}
