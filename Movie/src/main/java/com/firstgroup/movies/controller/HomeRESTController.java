package com.firstgroup.movies.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.service.MemberServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class HomeRESTController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberServiceImpl memberService;
	
	public void actorList() {
		log.info("REST actorList...........");
	}
	
	@GetMapping(value="/admin/memberList")
	public ModelAndView memberList() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/memberList");
		List<MemberVO> memberList = memberService.getMemList();
		for(MemberVO member : memberList) {
			log.info(member);
		}
		mv.addObject("members", memberList);
		return mv;
	}
}
