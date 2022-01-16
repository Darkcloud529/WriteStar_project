package com.writestar.domain;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class UserVO {
	@NotEmpty
	@Email
	private String email;					// 회원 아이디
	@NotEmpty
	@Pattern(regexp="(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}")
	private String password;				// 회원 비밀번호
	@NotEmpty
	private String nickname;				// 회원 닉네임
	private String user_info;				// 회원 프로필 정보
	
	private List<BoardAttachVO> attachList; // 회원이 가지고 있는 첨부파일 정보
}
