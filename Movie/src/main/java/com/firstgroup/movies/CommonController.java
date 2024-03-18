package com.firstgroup.movies;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	@GetMapping("/loginCheck")
	public void LoginCheck(String error, String logout, Model model) {
		
	}
}
