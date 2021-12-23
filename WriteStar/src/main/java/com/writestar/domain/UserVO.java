package com.writestar.domain;

import lombok.Data;

@Data
public class UserVO {			// Oracle 내 user 테이블
	
	private String email;  		// user 테이블 email 컬럼
	private String password; 	// user 테이블 password 컬럼
	private String nickname; 	// user 테이블 nickname 컬럼
	private String user_info;	// user 테이블 user_info 컬럼
}
