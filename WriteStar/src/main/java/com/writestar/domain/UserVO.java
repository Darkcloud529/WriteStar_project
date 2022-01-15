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
	private String email;
	@NotEmpty
	@Pattern(regexp="(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}")
	private String password;
	@NotEmpty
	private String nickname;
	private String user_info;
	
	private List<BoardAttachVO> attachList;
}
