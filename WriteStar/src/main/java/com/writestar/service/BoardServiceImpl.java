package com.writestar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.writestar.domain.BoardAttachVO;
import com.writestar.domain.BoardVO;
import com.writestar.domain.Criteria;
import com.writestar.mapper.BoardAttachMapper;
import com.writestar.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
		log.info(board);
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
			
		});
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
		
	}

	@Override
	public boolean modify(BoardVO board) {		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	}

	//@Override
	//public List<BoardVO> getList() {
	//	return mapper.getList();
	//}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}
}
