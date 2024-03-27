package com.firstgroup.movies.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.mapper.ActorMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class ActorServiceImpl implements ActorService {
	
	@Setter(onMethod_ = @Autowired)
	private ActorMapper actorMapper;
	
}
