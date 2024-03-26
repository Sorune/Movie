package com.firstgroup.movies.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesVO;
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
	public void loginAuth(Model model) {
		log.info(model);
	}
	
	@GetMapping("/register")
	public String register() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication instanceof AnonymousAuthenticationToken)
			return "register";
		return "redirect:/";
		
	
	}
	
	@PostMapping("/register")
	public String register(MemberVO memVo) {
		try {
			memberService.register(memVo);
			//Auth
		}	catch (DuplicateKeyException e) {
				return " redirect:register?error_code=-1";
		}	catch(Exception e) {
			e.printStackTrace();
			return"redirect:/register?error_code=-99";
		}
		return "redirect:/loginAuth";
	}
	
	@GetMapping("/update") //회원 정보 수정 페이지
	public String editPage(@AuthenticationPrincipal Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info(user);
		MemberVO member = user.getMember();
		log.info(member);
		String id = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
		log.info(id);
		log.info(model);
		MemberVO memVo = memberService.getMember(member.getId());
		log.info(memVo);
		//model.addAttribute("user",memVo);
		return "editPage";
	
	}
	/*
	 * @PostMapping("/update") public String edit(MemberVO memVo) { //회원 정보 수정
	 * String id
	 * =(String)SecurityContextHolder.getContext().getAuthentication().getPrincipal(
	 * ); memVo.setId(id); memberService.edit(memVo); return"redirect:/"; }
	 */
	
	@GetMapping("/test")
	public void test() {
		//테스트 페이지용
	}
	
	@GetMapping("/home")
	public void home(Model model) {
		log.info(model);
	}
	
	@GetMapping("/logout")
	public void logout() {
		log.info("logout........");
	}
	
	@GetMapping("/uploadest")
	public void uploadest() {
		log.info("upload...........");
	}
	
	@GetMapping("/movie/movieList")
	public void movieList(Criteria cri, Model model) {
		
	}
	
	@GetMapping("/movie/register")
	public void movieRegister() {
		log.info("movie register........");
	}
	
	@PostMapping("/movie/register")
	public void movieRegisterAction(@ModelAttribute("MoviesVO") MoviesVO mov, Model model, MultipartFile[] uploadFile) {
		log.info("movie register action..............");
		log.info(mov);
		mov = moviesService.registerMovies(mov);
		log.info(model);
	}
	
	@GetMapping("/movie/movieModify")
	public void movieModify() {
		//우상제 테스트중
	}
	
	@GetMapping("/actor/actorList")
	public void actorList() {
		log.info("actorList...............");
	}
	
	@GetMapping("/actor/register")
	public void actorRegister() {
		log.info("actor register..............");
	}
	
	@PostMapping("/actor/register")
	public String actorRegister(@ModelAttribute("ActorVO") ActorVO act, Model model) {
		log.info("post actor register...........");
		log.info(act);
		log.info(model);
		
		return "redirect:/actor/actorList"; 
	}
	
}
