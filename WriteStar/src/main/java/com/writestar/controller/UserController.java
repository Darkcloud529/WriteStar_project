package com.writestar.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.writestar.domain.UserVO;
import com.writestar.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 컨트롤러역할
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor // 자동주입
public class UserController {
	private UserService userService;
	private BCryptPasswordEncoder pwdEncoder;
	
	// 회원 가입 화면
	@GetMapping("/userRegister")
	public void register() {}
	
	// 회원 가입 처리
	@PostMapping("/userRegister")
	public String register(UserVO userVO) {
		String inputPass = userVO.getPassword();
		String pwd = pwdEncoder.encode(inputPass);
		userVO.setPassword(pwd);
		
		userService.register(userVO);
		userService.grantAuth(userVO);
		return "redirect:/user/login";
	}
	
	// 아이디 중복 체크
	@PostMapping("/emailCheck")
	@ResponseBody //HTTP 요청 본문에 담긴 값들을 자바객체로 변환시켜, 객체에 저장
	public int emailCheck(UserVO userVO) {
		int result = userService.emailCheck(userVO);
		return result;
	}
	// 닉네임 중복 체크
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(UserVO userVO) {
		int result = userService.nicknameCheck(userVO);
		return result;
	}
}
