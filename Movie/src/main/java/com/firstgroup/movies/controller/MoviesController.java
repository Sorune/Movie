package com.firstgroup.movies.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		model.addAttribute("comments", movService.commentList(movbno));
	}
}
