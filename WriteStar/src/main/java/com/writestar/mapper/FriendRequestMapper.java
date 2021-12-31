package com.writestar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.writestar.domain.FriendRequestVO;

public interface FriendRequestMapper {
	// 친구신청 목록 조회
	public List<FriendRequestVO> selectRequest(String to_user);
	
	// 친구신청 등록
	public void insertRequest(FriendRequestVO request);

	// 친구신청 기록 삭제
	public void deleteRequest(Map<String, Object> map);
	
}
