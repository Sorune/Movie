package com.firstgroup.movies.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.security.CustomUserDetailsService;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.MemberServiceImpl;
import com.firstgroup.movies.service.MoviesServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private MemberServiceImpl memberService;

	@Setter(onMethod_ = @Autowired)
	private MoviesServiceImpl moviesService;

	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl actorService;
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;


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

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@GetMapping("/loginCheck")
	public void LoginCheck(String error, String logout, Model model) {

	}

	@GetMapping("/loginAuth")
	public void loginAuth(Model model) {
		log.info(model);
	}

	@GetMapping("/register")
	public String register() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof AnonymousAuthenticationToken)
			return "register";
		return "redirect:/";

	}

	@PostMapping("/register")
	public String register(MemberVO memVo) {
		try {
			memberService.register(memVo);
			// Auth
		} catch (DuplicateKeyException e) {
			return " redirect:register?error_code=-1";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/register?error_code=-99";
		}
		return "redirect:/loginAuth";
	}

	@GetMapping("/member/update") // 회원 정보 수정 페이지
	public String editPage(@AuthenticationPrincipal Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		/*
		 * log.info(user); MemberVO member = user.getMember().getId(); log.info(member);
		 * String id =
		 * SecurityContextHolder.getContext().getAuthentication().getPrincipal().
		 * toString(); log.info(id); log.info(model);
		 */
		MemberVO memVo = memberService.getMember(user.getMember().getId());
		log.info(memVo);
		model.addAttribute("user", memVo);
		return "editPage";

	}
	
	@PostMapping("/member/update")
	public String edit(@ModelAttribute("MemberVO") MemberVO memVo) { //회원 정보 수정
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memVo.setId(user.getUsername());
		log.info(memVo);
		memberService.edit(memVo); 
		log.info(user);
		sessionReset(user.getUsername());
		
		return "redirect:/"; 
	}

	@GetMapping("/home")
	public void home(Model model) {
		log.info(model);
	}
	
	public void sessionReset(String username) {
	    UserDetails userDetails = customUserDetailsService.loadUserByUsername(username);
	    Authentication newAuthentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
	    SecurityContextHolder.getContext().setAuthentication(newAuthentication);
	}

}
