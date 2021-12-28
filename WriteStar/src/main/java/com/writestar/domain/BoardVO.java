package com.writestar.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private Date regdate;
	private String address;
	private String post_type;
	private String email;
}
