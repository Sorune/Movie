package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.ActorVO;

@Mapper
public interface ActorMapper {

	public void insertActor(ActorVO atv); // c
	public List<ActorVO> getActorList(); // r - total actor
	ActorVO getActor(Long actbno); // r - actor 
	public boolean modify(ActorVO atv); // u - actor
	public boolean remove(Long actbno); // d - actor
	
}
