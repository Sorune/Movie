package com.firstgroup.movies.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.firstgroup.movies.domain.Criteria;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CommonController {
		
	// jsp 파일 업로드용 매핑
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		log.info("update ajax post.......");
		
		String uploadFolder = "D://upload";
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file Path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("only file name : " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
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
