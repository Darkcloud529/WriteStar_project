package com.writestar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.writestar.domain.Criteria;
import com.writestar.domain.ReplyPageDTO;
import com.writestar.domain.ReplyVO;
import com.writestar.mapper.BoardMapper;
import com.writestar.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int registerReply(ReplyVO reply) {
		
		boardMapper.updateReplyCnt(reply.getBno(), 1);
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
	
	@Transactional
	@Override
	public int removeReply(Long rno) {
		ReplyVO vo = mapper.readReply(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.deleteReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}


	
}