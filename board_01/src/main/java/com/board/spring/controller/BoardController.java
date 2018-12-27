package com.board.spring.controller;

import java.io.IOException;
import java.security.PrivateKey;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.spring.model.BoardVO;
import com.board.spring.security.RSA;
import com.board.spring.service.BoardService;

/**
 * 게시글 Controller
 * @author 유지상
 */
@Controller
public class BoardController {

	@Autowired // 게시글 서비스 객체
	BoardService boardService;
	
	/**
	 * 게시글 리스트 및 메인화면
	 * @param currentPage	현재페이지 번호
	 * @return 게시글 리스트 페이지
	 */
	@RequestMapping(value = "/")
	public String main(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int currentPage) {
		// 페이지 정보
		Map<String, Integer> pageInfoMap = boardService.setPageInfo(currentPage);
		// 게시글 리스트
		List<BoardVO> boardList = boardService.getBoardList(pageInfoMap);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageInfoMap);
		
		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		req.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());

		return "index";
	}

	/**
	 * 게시글 상세보기
	 * @param boardIdx		게시글 번호
	 * @param currentPage	현제 페이지
	 * @return 게시글 상세페이지
	 */
	@RequestMapping(value = "/readBoard", method = RequestMethod.GET)
	public String readBoard(Model model, int boardIdx, int currentPage) {
		// 게시글 상세정보
		BoardVO board = boardService.getBoard(boardIdx);

		model.addAttribute("board", board);
		model.addAttribute("currentPage", currentPage);

		RSA rsa = RSA.getEncKey();
		model.addAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
		model.addAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
		
		return "boardView";
	}

	/**
	 * 게시글 작성
	 * @param board	게시글
	 * @throws Exception 
	 */
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	public void writeBoard(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute("board") BoardVO board) throws Exception {
		
		//암호화 로직
		HttpSession session = req.getSession();
		PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__"); 
		session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
		
		board.setPassword(RSA.decryptRsa(privateKey, board.getPassword()));
		
		// 게시글 추가 결과
		boolean result = boardService.addBoard(board);

		try { // 결과값 ajax로 전송
			resp.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 게시글 수정
	 * @param board 게시글
	 * @param currentPage 현제 페이지
	 */
	@RequestMapping(value = "/modifyBoard", method = RequestMethod.POST)
	public String modifyBoard(Model model, @ModelAttribute("board") BoardVO board, String newPassword, int currentPage) {
		// 비밀번호를 새로 입력시에만 바꿔줌
		if(newPassword != "") {
			//비밀번호 암호화
			board.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt(10)));
		}
		
		// 게시글 수정 결과
		boolean result = boardService.modifyBoard(board);
		
		
		if (result) {
			// 게시글 수정 완료시 해당 게시글 가져오기
			board = boardService.getBoard(board.getBoardIdx());
		} else {
			// TODO 수정실패시 작업
		}

		model.addAttribute("board", board);
		model.addAttribute("currentPage", currentPage);

		return "boardView";
	}

	/**
	 * 게시글 삭제
	 * @param boardIdx		게시글 번호
	 * @param currentPage	현제 페이지
	 * @return 게시글 리스트 페이지
	 */
	@RequestMapping(value = "/deleteBoard")
	public String deleteBoard(int boardIdx, int currentPage) {
		
		// 게시글 삭제 결과
		boolean result = boardService.deleteBoard(boardIdx);

		if (result) {
			// TODO 삭제 완료시 작업
		} else {
			// TODO 삭제 실패시 작업
		}
		return "redirect:/?currentPage=" + currentPage;
	}
	
	/**
	 * 비밀번호 검사
	 * @param password		비밀번호
	 */
	@RequestMapping(value = "/checkPassword")
	public void checkPassword(HttpServletResponse resp ,int boardIdx, String password) {
		boolean result = false;
		result = boardService.checkPassword(boardIdx, password);
		
		try { // 결과값 ajax로 전송
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
