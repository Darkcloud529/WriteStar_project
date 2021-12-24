package com.writestar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.writestar.domain.UserVO;
import com.writestar.domain.loginDTO;
import com.writestar.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_=@Autowired) // UserMapper 주입
	private UserMapper mapper;
	
	@Override 
	// 회원 가입 처리
	public void register(UserVO userVO) {
		mapper.register(userVO);
	}

	@Override
	//아이디 중복 확인
	public int emailCheck(UserVO userVO) {
		int result = mapper.emailCheck(userVO);
		return result;
	}

	@Override
	//닉네임 중복 확인
	public int nicknameCheck(UserVO userVO) {
		int result = mapper.nicknameCheck(userVO);
		return result;
	}

	@Override
	// 로그인 처리
	public UserVO login(loginDTO loginDTO) {
		return mapper.login(loginDTO);
	}

}
