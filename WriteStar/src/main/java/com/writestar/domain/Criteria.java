package com.writestar.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	private int pageNum; //페이지번호
	private int amount; //한 페이지당 출력되는 데이터수
	
	public Criteria() {
		this(1,10); // 기본생성자 기본값 지정
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/*
	 public String getListLink() { 
	 UriComponentsBuilder builder = UriComponentsBuilder.fromPath("") .queryParam("pageNum", this.pageNum)
	  .queryParam("amount", this.getAmount()) .queryParam("type", this.getType())
	  .queryParam("keyword", this.getKeyword());
	  
	  return builder.toUriString(); }
	 */
}

