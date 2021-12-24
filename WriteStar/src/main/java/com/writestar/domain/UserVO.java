package com.writestar.domain;

import lombok.Data;

@Data
public class UserVO {
	private String email;
	private String password;
	private String nickname;
	private String user_info;
}
