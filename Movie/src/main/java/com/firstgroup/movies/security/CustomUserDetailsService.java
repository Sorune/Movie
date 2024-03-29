package com.firstgroup.movies.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.mapper.MemberMapper;
import com.firstgroup.movies.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + id);

		// userName means userid
		MemberVO vo = this.memberMapper.read(id);

		log.warn("queried by member mapper: " + vo);

		return vo == null ? null : new CustomUser(vo);
	}
}
