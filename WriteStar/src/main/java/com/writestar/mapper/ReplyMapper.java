package com.writestar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.writestar.domain.Criteria;
import com.writestar.domain.ReplyVO;

public interface ReplyMapper {
	// 댓글 입력
	public int insertReply(ReplyVO reply);
	
	// 특정 댓글 조회
	public ReplyVO readReply(Long rno);

	// 댓글 수정
	public int updateReply(ReplyVO reply);
	
	// 댓글 삭제
	public int deleteReply(Long rno);
	
	// 댓글 페이징
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
}
