package com.writestar.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.writestar.domain.UserVO;
import com.writestar.domain.loginDTO;
import com.writestar.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 컨트롤러역할
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor // 자동주입
public class UserController {
	private UserService userService;
	
	// 회원 가입 화면
	@GetMapping("/userRegister")
	public void register() {}
	
	// 회원 가입 처리
	@PostMapping("/userRegister")
	//@Valid : 유효성 검사가 필요한 객체에 추가
	//BindingResult : 객체 검증 결과에 대한 정보를 담고 있다.
	public String register(UserVO userVO) {
		// 회원 가입 시 비밀번호를 암호화 하는 작업 -> 회원으로부터 받은 정보 중 비밀번호의 경우 암호화해서 보관해야 보안에 비교적 안전
		// BCrypt.hashpw(parameter1, BCrypt.gensalt()) 
		// parameter : 암호화할 비밀번호 
		// BCrypt.gensalt() : 암호화된 비밀번호를 리턴
		// BCrypt를 사용하기 위해서는 pom.xml 추가 -> 'jbcrypt'
		String hashedPw = BCrypt.hashpw(userVO.getPassword(), BCrypt.gensalt());
		userVO.setPassword(hashedPw);
		userService.register(userVO);
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
