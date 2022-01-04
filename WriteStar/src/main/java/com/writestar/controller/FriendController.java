package com.writestar.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.writestar.domain.FriendRequestVO;
import com.writestar.domain.FriendVO;
import com.writestar.service.FriendService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/friend/*")
@AllArgsConstructor
public class FriendController {
	private FriendService service;
	
	// 친구(신청) 목록 조회
	@GetMapping("/friendRequestPage")
	public void list(@RequestParam("to_user") String to_user, Model model) {
		// 친구요청 목록 조회
		model.addAttribute("list", service.selectRequestList(to_user));
		// 친구 목록 조회
		model.addAttribute("friendList", service.selectFriendList(to_user));
	}
	
	// 친구신청 응답	
	@ResponseBody
	@RequestMapping(value="/response", method=RequestMethod.POST)
	public String response(@RequestParam Map<String, Object> map, RedirectAttributes rttr) {
		String fromUser = (String) map.get("fromUser");
		String toUser = (String) map.get("toUser");
		String hdnYN = (String) map.get("hdnYN");
		
		System.out.println(">>>>>>>>> FriendController >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(">>>>>>>>> map : " + map);
		System.out.println(">>>>>>>>> hdnYN : " + hdnYN);
		
		if(service.response(map)) {
			rttr.addFlashAttribute("result","success");
		}
		 
		return "redirect:/friend/friendRequestPage";
	 }
	
	// 친구신청
	@PostMapping("/addFriend")
	public String addFriend(FriendRequestVO request, RedirectAttributes rttr) {
		service.addFriend(request);
		rttr.addFlashAttribute("result","success");
		
		return "redirect:/board/friendRequestPage";
	}
	
	// 친구 삭제
	@PostMapping("/removeFriend")
	public String removeFriend(FriendVO friend, RedirectAttributes rttr) {
		System.out.println(">>>>>>>>> FriendController >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(">>>>>>>>> friend : " + friend);
		service.removeFriend(friend);

		rttr.addFlashAttribute("result","success");
		
		return "/friend/friendRequestPage";
	}
}
