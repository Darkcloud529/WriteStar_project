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
	//프로필 정보 변경
	public boolean userInfoModify(UserVO userVO);
	//회원 권한 부여
	public void grantAuth(UserVO userVO);
}
