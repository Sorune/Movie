package com.firstgroup.movies.domain;

import lombok.Data;

@Data
public class MoviesAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private Long movBno;
}
