package com.firstgroup.movies.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.firstgroup.movies.domain.ImgVO;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.domain.MoviesCommentVO;
import com.firstgroup.movies.domain.MoviesVO;
import com.firstgroup.movies.security.domain.CustomUser;
import com.firstgroup.movies.service.ActorServiceImpl;
import com.firstgroup.movies.service.ImgService;
import com.firstgroup.movies.service.MemberServiceImpl;
import com.firstgroup.movies.service.MoviesService;
import com.firstgroup.movies.service.MoviesServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class CommonRESTController {
	
	@Setter(onMethod_ = @Autowired)
	private ImgService imgService;
	
	
	@Setter(onMethod_ = @Autowired)
	private MemberServiceImpl memberService;
	
	@Setter(onMethod_ = @Autowired)
	private MoviesServiceImpl moviesService;
	
	@Setter(onMethod_ = @Autowired)
	private ActorServiceImpl actorService;
	
	@GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName){
		log.info("download file : "+fileName);
		
		Resource resource = new FileSystemResource("D://upload//" + fileName);
		
		log.info("resource : "+resource);
		
		String resourceName = resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition","attachment; filename="+new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}

	
	@GetMapping(value = "/movieList")
	public ModelAndView MovieList(Model model ) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/movieList");
		mv.addObject("movie", moviesService.getMovieList());
		
		return mv;
	}
	
	//@PostMapping(value = "/{tableName}/uploadAjaxAction", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	//@ResponseBody
	public ResponseEntity<List<?>> uploadAjaxPost(MultipartFile[] uploadFile,@PathVariable String tableName){
		/* ResponseEntity<? extends ImgVO > result = null; */
		String table = String.format("tbl_%s_img", tableName);
		log.info(table);
		/* List<? extends ImgVO> list = new ArrayList<ImgVO>(); */
		List<ImgVO> list = new ArrayList<ImgVO>();
		
		String uploadFolder = String.format("/resources/img/%s", tableName); 
		uploadFolder = uploadFolder.replace("/", File.separator);
		String uploadFolderPath = getFolder();
		log.info(uploadFolder);
		log.info(uploadFolderPath);
		// 날짜별 폴더생성 준비 ------------
		File uploadPath = new File(uploadFolder, getFolder()); // 날짜타입 지정 메서드(getFolder()) 파라미터 값 전달
		
		if(uploadPath.exists() == false) { // 저장된 경로와 파일의 이름이 존재하지않으면..
			uploadPath.mkdirs(); // 지정한 경로에 해당이름의(날짜형식) 파일을 생성한다.
		}
		//  make yyyy/MM/dd folder
		
		log.info("upload path : " + uploadPath); // 업로드 파일경로 로그에 출력
		
		for(MultipartFile multipartFile : uploadFile) {
			
			ImgVO imgVO = new ImgVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file Path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName); // 업로드된 파일이름 로그 출력
			imgVO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID(); // 랜덤한 문자생성
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 랜덤한 문자를 String parsing후 변수에 저장
			
			log.info("---------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename()); // 업로드된 파일의 이름
			log.info("Upload File Size : " + multipartFile.getSize());	// 업로드 된 파일의 크기(용량)
			
			// File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				imgVO.setUuid(uuid.toString());
				imgVO.setUploadPath(uploadFolderPath);
				imgVO.setMovBno(1L);
				imgService.insert(table,imgVO);
				// add to List
				list.add(imgVO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 중복된 이름의 첨부파일 처리
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포멧 생성
		Date date = new Date(); // java.util의 날짜 생성
		String str = sdf.format(date); // String 타입으로 포멧팅된 날짜 저장
		return str.replace("-", File.separator); // 날짜형식 맞춰서 파일 이름 지정
	}
	
	@PostMapping("/like/{combno}")
	private ResponseEntity<String> like(@PathVariable Long combno){
		
		return moviesService.like(combno) == 1? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
}
