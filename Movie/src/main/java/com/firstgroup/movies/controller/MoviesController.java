package com.firstgroup.movies.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.ActorService;
import com.firstgroup.movies.service.ImgService;
import com.firstgroup.movies.service.MemberService;
import com.firstgroup.movies.service.MoviesService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@AllArgsConstructor
public class MoviesController {
	
	@Setter(onMethod_ = @Autowired)
	private MoviesService movService; // 영화 정보
	@Setter(onMethod_ = @Autowired)
	private MemberService memService; // 유저 정보
	@Setter(onMethod_ = @Autowired)
	private ImgService imgService;
	@Setter(onMethod_ = @Autowired)
	private ActorService actService;

	@DeleteMapping(value = "/{combno}", produces = {MediaType.TEXT_PLAIN_VALUE,})	
	public ResponseEntity<String> remove(@RequestBody MoviesCommentVO vo, @PathVariable("combno") Long combno){
		
		log.info(combno);
		
		return movService.removeComment(combno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR) ;
	}
	
	

	@PostMapping(value = "/regComment") 
	public ResponseEntity<String> insertComment(@RequestParam Map<String,String> formData) {
	    MoviesCommentVO vo = new MoviesCommentVO();
	    vo.setMemBno(Long.parseLong(formData.get("memBno")));
	    vo.setMovBno(Long.parseLong(formData.get("movBno")));
	    vo.setContent(formData.get("content"));
	    vo.setStars(Integer.parseInt(formData.get("stars")));

	    log.info("---------------댓글 작성 객체 확인 : "+vo.getContent());
	    log.info("---------------댓글 작성 객체 확인 : "+vo.getMemBno());
	    log.info("---------------댓글 작성 객체 확인 : "+vo.getMovBno());
	    log.info("---------------댓글 작성 객체 확인 : "+vo.getStars());

	    return movService.insertComment(vo) == 1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/movies/getMovie/{movbno}")
	public ModelAndView getMovie(@PathVariable Long movbno,@AuthenticationPrincipal Model model){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/getMovie");
		mv.addObject("movie", movService.get(movbno));
		
		String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
		if(role.equals("[ROLE_ANONYMOUS]")) {
			
		} else {
			
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
		}
		return mv;
	}
	
	@GetMapping("/movies/register")
	public ModelAndView movieRegister(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movies/register");
		log.info("movie register........");
		
		model.addAttribute("actorList", actService.actorList());
		return mv;
	}	
	
	@PostMapping("/movies/register")
	public ModelAndView movieRegisterAction// 폼에서 입력한 데이터와 다수의 데이터를 List로 묶어서 가져옴
			(@RequestBody MoviesVO mov) {
		
		log.info("movie register action..............");
		log.info(mov);
		/*
		 * log.info(formData.get("title")); log.info(formData.get("content"));
		 * log.info(createdDate); log.info(actorList);
		 * 
		 * 
		 * // 빈 객체 생성 MoviesVO mov = new MoviesVO();
		 * 
		 * mov.setTitle(formData.get("title")); mov.setContent(formData.get("content"));
		 * mov.setCreatedDate(createdDate); mov.setDirector("테스트용 감독");
		 * 
		 * // 리스트가 비어있지 않은 경우에만 String.join() 메소드 사용 if (!genre.isEmpty() ||
		 * !actorList.isEmpty()) { // 리스트로 들어온 value를 ,를 붙여 합쳐줌 String genteStr =
		 * genre.stream().collect(Collectors.joining(",")); String actorStr =
		 * actorList.stream().collect(Collectors.joining(",")); log.info(genteStr);
		 * log.info(actorStr);
		 * 
		 * mov.setActor(actorStr); }
		 */
		/*
		 * for(ImgVO img : mov.getImgList()) { img.setBno(mov.getMovBno());
		 * img.setTblName("tbl_Movies_img"); log.info(img); imgService.insert(img); }
		 */
	    //movService.registerMovies(mov);
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/movies/movieList");
		return mv;
	}
	
	
	@GetMapping("/movies/list")
	public ModelAndView movieList(Criteria cri, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movies/movieList");

		model.addAttribute("movieList",movService.getMovieList());
		
		return mv;
	}
	
	
 	@DeleteMapping("/movies/delete/{movBno}") 
 	public ResponseEntity<String> remove(@PathVariable Long movBno, Model model){
 		log.info("삭제할 영화 게시물 번호 : " + movBno);
 		
 		return null;
 	}


	
}
