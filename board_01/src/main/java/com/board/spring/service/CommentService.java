package com.board.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.board.spring.model.CommentVO;

/**
 * 댓글 Service
 * @author 유지상
 */
@Service
public interface CommentService {

	// 댓글 리스트 가져오기
	public List<CommentVO> getCommentList(Map<String, Object> pageInfoMap, int boardIdx);
	
	// 댓글 추가
	public boolean addComment(CommentVO comment);
	
	// 댓글 수정
	public boolean modifyComment(CommentVO comment);
	
	// 댓글 삭제
	public boolean deleteComment(int commentIdx);
		
	// 페이지 정보 셋팅
	public Map<String, Object> setPageInfo(int currentPage, int totalCount, String keyword, String type);
}