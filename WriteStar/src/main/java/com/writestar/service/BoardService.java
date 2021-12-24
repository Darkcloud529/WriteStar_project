package com.writestar.service;

import java.util.List;

import com.writestar.domain.BoardVO;
import com.writestar.domain.Criteria;

public interface BoardService {
	//글 등록
	public void register(BoardVO board);
	//글 조회 
	public BoardVO get(Long bno);
	//글 수정
	public boolean modify(BoardVO board);
	//글 삭제
	public boolean remove(Long bno);
	//글 목록
	public List<BoardVO> getList(Criteria cri);
}
