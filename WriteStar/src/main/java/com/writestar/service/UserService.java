package com.writestar.service;

import com.writestar.domain.UserVO;
import com.writestar.domain.loginDTO;

public interface UserService {
	//회원 가입 처리
	public void register(UserVO userVO);
	//아이디 중복 확인
	public int emailCheck(UserVO userVO);
	//닉네임 중복 확인
	public int nicknameCheck(UserVO userVO);
	//로그인 처리
	public UserVO login(loginDTO loginDTO);
	//프로필 정보 변경
	public boolean userInfoModify(UserVO userVO);
}
