package com.writestar.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private String email;
	private String password;
	private String nickname;
	private String user_info;
	private Date regDate;
	private Date updateDate;
	private boolean enabled;
	private List<AuthVO> authList;
}
