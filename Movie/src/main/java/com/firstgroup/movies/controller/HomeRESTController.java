package com.firstgroup.movies.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
public class HomeRESTController {
	
	public void actorList() {
		log.info("REST actorList...........");
	}
}
