package com.writestar.mapper;

import java.util.List;

import com.writestar.domain.BoardAttachVO;

public interface BoardAttachMapper {
		//첨부파일 등록
		public void insert(BoardAttachVO vo);
		//첨부파일 삭제
		public void delete(String uuid);
		//첨부파일 목록
		public List<BoardAttachVO> findByBno(Long bno);
		
		public List<BoardAttachVO> getOldFiles();
		
		public void deleteAll(Long bno);
}
