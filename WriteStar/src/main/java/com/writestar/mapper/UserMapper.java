package com.writestar.mapper;

import com.writestar.domain.UserVO;
import com.writestar.domain.loginDTO;

public interface UserMapper {
	//로그인
	public UserVO login(loginDTO loginDTO);
	//회원 가입 처리
	public void register(UserVO userVO);
	//아이디 중복 확인
	public int emailCheck(UserVO userVO);
	//닉네임 중복 확인
	public int nicknameCheck(UserVO userVO);
	//프로필 정보 변경
	public int userInfoUpdate(UserVO userVO);
	//닉네임 변경
	//비밀번호 변경
}
