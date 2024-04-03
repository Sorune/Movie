package com.firstgroup.movies.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

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
import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.ActorService;
import com.firstgroup.movies.service.ImgService;
import com.firstgroup.movies.service.MemberService;
import com.firstgroup.movies.service.MoviesService;
import com.firstgroup.movies.util.Utility;

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
	@Setter(onMethod_ = @Autowired)
	private Utility util;
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
		MoviesVO mov = movService.get(movbno);
		mov.setImgList(imgService.findByBno("tbl_movies_img", movbno));
		mov.setTitleList(imgService.findByBno("tbl_title_img", movbno));
		mov.setContentList(imgService.findByBno("tbl_content_img", movbno));
		/*
		 * long[] tmp = util.parseToList(mov.getActor()); for(long tp : tmp) {
		 * mov.getActList().add(actService.getActor(tp)); }
		 */
		mv.addObject("movie", mov);
		
		String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
		if(role.equals("[ROLE_ANONYMOUS]")) {
			
		} else {
			
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberVO member = user.getMember();
			String id = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
			MemberVO memVo = memService.getMember(member.getId());
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
	public String movieRegisterAction(@RequestBody MoviesVO mov) { // 폼에서 입력한 데이터와 다수의 데이터를 List로 묶어서 가져옴

		log.info("movie register action..............");
		log.info(mov);
		 
		 // 리스트가 비어있지 않은 경우에만 String.join() 메소드 사용 
		 if (!mov.getActorList().isEmpty()) { // 리스트로 들어온 value를 ,를 붙여 합쳐줌 
		 //genre.stream().collect(Collectors.joining(","));
			 //[actorbno, actorbno, actorbno] 들어온 값 String으로 ,를 붙여 만들어줌
			 mov.setActor(mov.getActorList().stream().collect(Collectors.joining(",")));
		  }
		 mov.setDirector("테스트용 감독");
		 movService.registerMovies(mov);
		 
		for (ImgVO img : mov.getImgList()) {
			img.setBno(mov.getMovBno());
			img.setTblName("tbl_movies_img");
			log.info(img);
			imgService.insert(img);
		}
		
		for (ImgVO img : mov.getTitleList()) {
			img.setBno(mov.getMovBno());
			img.setTblName("tbl_title_img");
			log.info(img);
			imgService.insert(img);
		}
		
		for (ImgVO img : mov.getContentList()) {
			img.setBno(mov.getMovBno());
			img.setTblName("tbl_content_img");
			log.info(img);
			imgService.insert(img);
		}
		return mov.getMovBno().toString();
	}
	
	@GetMapping("/movies/list")
	public ModelAndView movieList(Criteria cri, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movies/movieList");
		
		List<MoviesVO> movieList = movService.getMovieList();
		 for(MoviesVO vo: movieList) {
	        vo.setImgList(imgService.findByBno("tbl_movies_img", vo.getMovBno()));
	      }
		model.addAttribute("movieList",movieList);
		return mv;
	}

	@DeleteMapping("/movies/remove/{movBno}")
	public ResponseEntity<String> remove(@PathVariable Long movBno) {
	    // movBno를 사용하여 영화 삭제 로직을 수행
	    log.info("삭제할 영화 게시물 번호: " + movBno);
	    
		return movService.removeMovie(movBno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/movies/remove/{movBno}")
	public ModelAndView delete(@PathVariable Long movBno, HttpServletResponse response) {
	    // movBno를 사용하여 영화 삭제 로직을 수행
	    log.info("삭제할 영화 게시물 번호: " + movBno);
	    movService.removeMovie(movBno);
	    
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movies/movieList");
		
		try {
			response.sendRedirect("/movies/list");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}

	//---03.30
 	@GetMapping("/movies/modify/{movbno}")
 	public ModelAndView updatePage(@PathVariable Long movbno, Model model) {
 		ModelAndView mv = new ModelAndView();
 		mv.setViewName("/movies/modify");
 		log.info("updatePage : " + movbno);
		MoviesVO mov = movService.get(movbno);
		mov.setImgList(imgService.findByBno("tbl_movies_img", movbno));
		mov.setTitleList(imgService.findByBno("tbl_title_img", movbno));
		mov.setContentList(imgService.findByBno("tbl_content_img", movbno));
 		model.addAttribute("movie",mov);
 		model.addAttribute("actorList", actService.actorList());
		return mv;
 	}
 	
 	@PostMapping("/movies/modify")
 	public ModelAndView modify(@RequestBody MoviesVO mov) {

 		 // 리스트가 비어있지 않은 경우에만 String.join() 메소드 사용 
		 if (!mov.getActorList().isEmpty()) { // 리스트로 들어온 value를 ,를 붙여 합쳐줌 
			 //genre.stream().collect(Collectors.joining(","));
				 
				 //[actorbno, actorbno, actorbno] 들어온 값 String으로 ,를 붙여 만들어줌
				 mov.setActor(mov.getActorList().stream().collect(Collectors.joining(",")));
				 mov.setDirector("테스트용 수정감독");
			  }
			ImgVO tmp = mov.getImgList().get(0);
			tmp.setBno(mov.getMovBno());
			tmp.setTblName("tbl_movies_img");
			imgService.delete(tmp);
			tmp.setTblName("tbl_title_img");
			imgService.delete(tmp);
			tmp.setTblName("tbl_content_img");
			imgService.delete(tmp);
			for (ImgVO img : mov.getImgList()) {
				img.setBno(mov.getMovBno());
				img.setTblName("tbl_movies_img");
				log.info(img);
				imgService.insert(img);
				mov.setMovImgNo(img.getBno());
			}
			for (ImgVO img : mov.getTitleList()) {
				img.setBno(mov.getMovBno());
				img.setTblName("tbl_title_img");
				log.info(img);
				imgService.insert(img);
			}
			
			for (ImgVO img : mov.getContentList()) {
				img.setBno(mov.getMovBno());
				img.setTblName("tbl_content_img");
				log.info(img);
				imgService.insert(img);
			}
			movService.updateMovies(mov);
			// 페이지 이동
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/movies/movieList");
			return mv;
 		
 	}


	
}
