package com.writestar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.writestar.domain.Criteria;
import com.writestar.domain.ReplyVO;
import com.writestar.mapper.BoardMapper;
import com.writestar.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	private ReplyMapper mapper;
	//private BoardMapper boardMapper;	
	
	@Override
	public int registerReply(ReplyVO reply) {
		return mapper.insertReply(reply);
	}

	@Override
	public ReplyVO getReply(Long rno) {
		return mapper.readReply(rno);
	}

	@Override
	public int modifyReply(ReplyVO reply) {
		return mapper.updateReply(reply);
	}

	@Override
	public int removeReply(Long rno) {
		return mapper.deleteReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}
}
