package com.writestar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.writestar.domain.UserVO;
import com.writestar.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_=@Autowired) // UserMapper 주입
	private UserMapper mapper;
	
	@Override
	public void register(UserVO userVO) {
		mapper.register(userVO);
	}

	@Override
	public int emailCheck(UserVO userVO) {
		int result = mapper.emailCheck(userVO);
		return result;
	}

	@Override
	public int nicknameCheck(UserVO userVO) {
		int result = mapper.nicknameCheck(userVO);
		return result;
	}

}
