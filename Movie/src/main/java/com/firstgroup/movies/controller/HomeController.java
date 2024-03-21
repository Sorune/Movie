package com.firstgroup.movies.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firstgroup.movies.domain.Criteria;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("/loginCheck")
	public void LoginCheck(String error, String logout, Model model) {
		
	}
	
	@GetMapping("/loginAuth")
	public void loginAuth() {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping("/test")
	public void test() {
		//테스트 페이지용
	}
	
	@GetMapping("/admin")
	public void admin() {
		
	}
	
	@GetMapping("/home")
	public void home() {
		
	}
	
	@GetMapping("/logout")
	public void logout() {
		log.info("logout........");
	}
	
	@GetMapping("/uploadest")
	public void uploadest() {
		log.info("upload...........");
	}
	
	@GetMapping("/admin/movieList")
	public void movieList(Criteria cri, Model model) {
		//우상제 테스트중
		//model.addAttribute("list", service.getList(cri));
	}
	@GetMapping("/admin/movieRegister")
	public void movieRegister() {
		//우상제 테스트중
	}
	@GetMapping("/admin/movieModify")
	public void movieModify() {
		//우상제 테스트중
	}

}
