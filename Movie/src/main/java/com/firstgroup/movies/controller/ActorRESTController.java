package com.firstgroup.movies.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/actor")
@Log4j2
public class ActorRESTController {
	
	public void actorList() {
		log.info("REST actorList...........");
	}
}
