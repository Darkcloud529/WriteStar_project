package com.writestar.domain;

import lombok.Data;

@Data
public class FriendRequestVO {
	private long fno;
	private String from_user;
	private String to_user;
	
	private UserVO memberVO;
}