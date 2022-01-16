package com.writestar.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;							// 게시물 번호
	private String title;						// 게시물 제목
	private String content;						// 게시물 내용
	private Date regdate;						// 게시물 작성날짜
	private String address;						// 게시물 사진 속 주소
	private String post_type;					// 게시물 공개여부(1:전체공개, 2: 친구공개, 3: 비공개)
	private String email;						// 게시물 작성자(ID)
	private Long hits;							// 게시물 조횟수
		
	private UserVO userVO;						// 게시물 작성자 정보
	private List<BoardAttachVO> attachList;		// 게시물 첨부파일 정보 (출력)	 
	private BoardAttachVO thumbnail; 			// 게시물 첨부파일 조인 결과 (출력)
}
