package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.firstgroup.movies.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemList();
	
	public MemberVO getMember(String id);
	
	public void register(MemberVO memVo);
	
	public void edit(MemberVO memVo);
	
	public void withdraw(String id);
	
	public PasswordEncoder passwordEncoder();
}
