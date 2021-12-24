package com.writestar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.writestar.domain.BoardVO;
import com.writestar.domain.Criteria;
import com.writestar.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		mapper.insertSelectKey(board);
		
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
}
