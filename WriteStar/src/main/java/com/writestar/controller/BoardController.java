package com.writestar.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.writestar.domain.BoardAttachVO;
import com.writestar.domain.BoardVO;
import com.writestar.domain.Criteria;
import com.writestar.domain.PageDTO;
import com.writestar.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	//index용으로 테스트....
	@GetMapping("/index")
	public void index(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		//123 임의의 값
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	//index용으로 테스트....
	
	// 조회수 TOP 5 조회
	@GetMapping("/selectTop5List")
	public void selectTop5List(Model model) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> BoardController >>>>>>>>>>>>>>>>>>>>>>");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> selectTop5List >>>>>>>>>>>>>>>>>>>>>>");
		model.addAttribute("topList", service.selectTop5List());
	}
	
	//글 목록
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		//123 임의의 값
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	//글등록화면-입력페이지를 보여주는 역할
	@GetMapping("/register")
	public void register() {}
	
	//글등록처리
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info(board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	//글상세보기.글수정화면
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		// 조회수 처리
		service.hitsCount(bno);
		
	    // 게시글 상세 조회
		model.addAttribute("board", service.get(bno));
	}
	
	//글 수정
	@PostMapping("/modify")
	public String modify(BoardVO board,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify" + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
	    rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    rttr.addAttribute("type", cri.getType());
	    rttr.addAttribute("keyword",cri.getKeyword());
	    
		return "redirect:/board/list";
	}
	
	//글 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
	    rttr.addAttribute("amount", cri.getAmount());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    
		return "redirect:/board/list";
	}
	
	@GetMapping(value = "/getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
 
		List<BoardAttachVO> list = service.getAttachList(bno);
		//log.info(list.get(0).isFileType());
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }  
	    
	    attachList.forEach(attach -> {
			try {        
				Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
			    log.error("delete file error" + e.getMessage());
			}
	    });
	}
}

