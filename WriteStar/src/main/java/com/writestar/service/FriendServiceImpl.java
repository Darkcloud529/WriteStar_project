package com.writestar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.writestar.domain.FriendRequestVO;
import com.writestar.domain.FriendVO;
import com.writestar.mapper.FriendMapper;
import com.writestar.mapper.FriendRequestMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FriendServiceImpl implements FriendService {
	@Setter(onMethod_ = @Autowired)
	private FriendMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private FriendRequestMapper requestMapper;
	
	// 친구 목록 조회
	@Transactional
	@Override
	public List<FriendVO> selectFriendList() {
		return mapper.selectFriend();
	}
	
	// 친구요청 목록 조회
	@Transactional
	@Override
	public List<FriendRequestVO> selectRequestList() {
		return requestMapper.selectRequest();
	}

	// 친구요청 응답 처리
	@Transactional
	@Override
	public boolean response(Map<String, Object> map) {
		String hdnYN = (String) map.get("hdnYN");
		
		System.out.println(">>>>>>>>> FriendServiceImpl >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(">>>>>>>>> hdnYN : " + hdnYN);
		
		if ("Y".equals(hdnYN)) {
			// 친구신청 테이블 기록 삭제
			requestMapper.deleteRequest(map);
			// 친구 승인 시 친구목록 테이블에 등록
			mapper.insertFriend(map);
			mapper.reverseInsertFriend(map);
		} else if ("N".equals(hdnYN)) {
			// 친구신청 테이블 기록 삭제
			requestMapper.deleteRequest(map);
		}
		
		return false;
	}
}
