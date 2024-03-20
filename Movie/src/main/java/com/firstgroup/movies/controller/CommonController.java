package com.firstgroup.movies.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	@GetMapping("/loginCheck")
	public void LoginCheck(String error, String logout, Model model) {
		
	}
	
	@GetMapping("/loginAuth")
	public void loginAuth() {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping("/getMovie")
	public void getMovie() {
		
	}
	
	@GetMapping("/test")
	public void test() {
		//테스트 페이지용
	}
	
	@GetMapping("/admin")
	public void admin() {
		
	}
}
