package com.firstgroup.movies.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.service.ActorServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/actor/*")
@Log4j2
public class ActorRESTController {
	
	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl service;
	
	@GetMapping("/actorList") // actor 리스트
	public ModelAndView actorList(Model model) {
		log.info("REST actorList...........");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/actor/actorList");
		List<ActorVO> actList = service.actorList();
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
	
	@PostMapping("/register") // register
	public String register(@RequestBody ActorVO atv, Model model) {
		
		log.info("register : " + atv);
		
		log.info(model);
		
		service.insertActor(atv);
		
		// 처리 결과에 따른 응답 데이터 설정
        String message = "Actor " + atv.getName() + " registered successfully!";
        
        // 처리 결과를 리다이렉트할 페이지로 전달
        model.addAttribute("message", message);
		return "redirect:/actor/actorList";
	}
	
	@GetMapping("/get") // actor 조회
	public void get(@RequestParam("actbno") Long actbno, Model model) {
		
		log.info("/get");
		model.addAttribute("atv", service.get(actbno));
	}
	
	@PostMapping("/modify") // actor 수정
	public String modify(ActorVO atv, RedirectAttributes rttr) {
		log.info("modify : " + atv);
		
		if(service.modify(atv)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/actor/actorList";
	}
	
	@PostMapping("/remove") // actor 삭제
	public String remove(@RequestParam("actbno") Long actbno, RedirectAttributes rttr) {
		
		log.info("remove : " + actbno);
		if(service.remove(actbno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/actor/actorList";
	}
}
