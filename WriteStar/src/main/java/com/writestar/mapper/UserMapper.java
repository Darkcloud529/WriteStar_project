package com.writestar.mapper;

import com.writestar.domain.UserVO;

public interface UserMapper {
	//로그인
	
	//회원 가입 처리
	public void register(UserVO userVO);
	//아이디 중복 확인
	public int emailCheck(UserVO userVO);
	//닉네임 중복 확인
	public int nicknameCheck(UserVO userVO);
	//닉네임 변경
	//비밀번호 변경
	//프로필 정보 변경
}
