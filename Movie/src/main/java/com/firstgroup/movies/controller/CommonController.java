package com.firstgroup.movies.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.firstgroup.movies.domain.MoviesAttachVO;
import com.firstgroup.movies.mapper.MoviesAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CommonController {
	
	@Setter(onMethod_ = @Autowired)
	private MoviesAttachMapper attachMapper;
	
	// jsp 파일 업로드용 매핑
		@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<MoviesAttachVO>> 
		uploadAjaxPost(MultipartFile[] uploadFile){
			
			List<MoviesAttachVO> list = new ArrayList<>();
			String uploadFolder = "D://upload/"; 
			
			String uploadFolderPath = getFolder();
			
			// 날짜별 폴더생성 준비 ------------
			File uploadPath = new File(uploadFolder, getFolder()); // 날짜타입 지정 메서드(getFolder()) 파라미터 값 전달
			
			if(uploadPath.exists() == false) { // 저장된 경로와 파일의 이름이 존재하지않으면..
				uploadPath.mkdirs(); // 지정한 경로에 해당이름의(날짜형식) 파일을 생성한다.
			}
			//  make yyyy/MM/dd folder
			
			log.info("upload path : " + uploadPath); // 업로드 파일경로 로그에 출력
			
			for(MultipartFile multipartFile : uploadFile) {
				
				MoviesAttachVO attachDTO = new MoviesAttachVO();
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				// IE has file Path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				log.info("only file name : " + uploadFileName); // 업로드된 파일이름 로그 출력
				attachDTO.setFileName(uploadFileName);
				
				UUID uuid = UUID.randomUUID(); // 랜덤한 문자생성
				uploadFileName = uuid.toString() + "_" + uploadFileName; // 랜덤한 문자를 String parsing후 변수에 저장
				
				log.info("---------------------------------");
				log.info("Upload File Name : " + multipartFile.getOriginalFilename()); // 업로드된 파일의 이름
				log.info("Upload File Size : " + multipartFile.getSize());	// 업로드 된 파일의 크기(용량)
				log.info("Upload Full File Name : "+uploadFileName);
				log.info("Upload Full Path File Name : "+ uploadPath+"/"+uploadFileName);
				
				// File saveFile = new File(uploadFolder, uploadFileName);
				
				try {
					File saveFile = new File(uploadPath, uploadFileName);
					multipartFile.transferTo(saveFile);
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
					attachDTO.setMovBno(1L);
//					attachMapper.insert(attachDTO);
					// add to List
					list.add(attachDTO);
					
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
			} // end for
			
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName, String type){
			log.info("deleteFile : "+fileName);
			
			File file;
			
			try {
				file = new File("D:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
				
				file.delete();
				
				if(type!=null&&type.equals("image")) {
					String largeFileName = file.getAbsolutePath().replace("s_","");
					
					log.info(largeFileName);
					
					file = new File(largeFileName);
					
					file.delete();
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
			
			return new ResponseEntity<String>("deleted",HttpStatus.OK);
		}
		
		// 중복된 이름의 첨부파일 처리
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포멧 생성
			Date date = new Date(); // java.util의 날짜 생성
			String str = sdf.format(date); // String 타입으로 포멧팅된 날짜 저장
			return str.replace("-", File.separator); // 날짜형식 맞춰서 파일 이름 지정
		}
}
