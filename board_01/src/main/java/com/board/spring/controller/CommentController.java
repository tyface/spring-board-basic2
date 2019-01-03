package com.board.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.spring.model.CommentVO;
import com.board.spring.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired	// 댓글 서비스 객체
	CommentService commentService;
	
	@RequestMapping(value = "/writeComment")
	public void writeComment(@ModelAttribute("comment")CommentVO comment, String currentPage, int boardIdx) {
		System.out.println(comment);
		System.out.println(currentPage);
		System.out.println(boardIdx);
		
		
	}
}
