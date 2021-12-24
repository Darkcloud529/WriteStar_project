package com.writestar.service;

import java.util.List;
import java.util.Map;

import com.writestar.domain.FriendRequestVO;
import com.writestar.domain.FriendVO;

public interface FriendService {
	// 친구 목록 조회
	public List<FriendVO> selectFriendList();
	
	// 친구요청 목록 조회
	public List<FriendRequestVO> selectRequestList();
	
	// 친구요청 응답
	public boolean response(Map<String, Object> map);
}
