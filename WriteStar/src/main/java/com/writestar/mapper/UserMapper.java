package com.writestar.mapper;

import com.writestar.domain.UserVO;
import com.writestar.domain.loginDTO;

public interface UserMapper {
	//회원 가입 처리
	public void register(UserVO userVO);
	//아이디 중복 확인
	public int emailCheck(UserVO userVO);
	//닉네임 중복 확인
	public int nicknameCheck(UserVO userVO);
	//프로필 정보 변경
	public int userInfoUpdate(UserVO userVO);
	// 로그인 처리
	public UserVO read(String userid);
	// 회원 권한 부여
	public void auth(UserVO userVO);
}
