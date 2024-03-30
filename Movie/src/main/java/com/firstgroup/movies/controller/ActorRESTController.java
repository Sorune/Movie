package com.firstgroup.movies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.ImgServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/actor/*")
@Log4j2
public class ActorRESTController {
	
	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl service;
	@Setter(onMethod_ = @Autowired)
	private ImgServiceImpl imgService;
	/*
	 * @Setter(onMethod_ = @Autowired) private MemberServiceImpl memService;
	 */
	
	/*
	 * @GetMapping("/delete/{membno}") public void deleteMember(@PathVariable long
	 * membno) { memService.delete(membno); }
	 */
	
	@GetMapping("/list") // actor 리스트
	public ModelAndView actorList(Model model) {
		log.info("REST actorList...........");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/actor/actorList");
		List<ActorVO> actList = service.actorList();
		for(ActorVO atv : actList) {
			atv.setImgList(imgService.findByBno("tbl_actor_img", atv.getActbno()));
		}
		log.info(actList);
		mv.addObject("actorList", actList);
		return mv;
	}
	
	@GetMapping
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/actor/register");
		return mv;
	}
	
	
	@PostMapping(value="/register",produces = "application/text; charset=UTF-8") // register
	public String register(@RequestBody ActorVO atv, Model model, RedirectAttributes rttr) throws Exception{
		
		log.info("register : " + atv);
		
		log.info(model);
		
		service.insertActor(atv);
		log.info(atv);
		// 처리 결과에 따른 응답 데이터 설정
        for(ImgVO img : atv.getImgList()) {
        	img.setBno(atv.getActbno());
        	img.setTblName("tbl_Actor_img");
        	log.info(img);
            imgService.insert(img);
        }
        
        // 처리 결과를 리다이렉트할 페이지로 전달
		return atv.getName();
	}
	
	@GetMapping("/getActor/{actbno}") // actor 조회
	public ModelAndView getActor(@PathVariable Long actbno, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/actor/getActor");
		log.info("/actor/getActor");
		model.addAttribute("atv", service.getActor(actbno));
		return mv;
	}
	
	@PostMapping("/modify") // actor 수정
	public String modify(ActorVO atv, RedirectAttributes rttr) {
		log.info("modify : " + atv);
		
		if(service.modify(atv)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/actor/actorList";
	}
	
	// actor 삭제
	@GetMapping("/delete/{actBno}")
	public ResponseEntity<String> remove(@RequestParam Long actBno){
	    log.info("actBno? : " + actBno);
		/*
		 * if(actBno > 0) { }
		 */
	    
	    return service.remove(actBno) == 1 ?
	    		new ResponseEntity<>("success", HttpStatus.OK) :
	    		new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR)	;
	}
	
}
