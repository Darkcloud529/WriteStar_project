package com.writestar.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied: " + auth);
		model.addAttribute("msg","Access Denied");
	}
	
	@GetMapping("/user/login")
	public void loginInput(String error, String logout, Model model) {
		if(error!= null) {
			model.addAttribute("error", "로그인이 실패했습니다.");
		}
		if(logout!=null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	@GetMapping("/user/logout")
	public void logoutGET() {
		log.info("logout");
	}
	@PostMapping("/user/logout")
	public void logoutPost() {
		log.info("post custom logout");
	}

}
