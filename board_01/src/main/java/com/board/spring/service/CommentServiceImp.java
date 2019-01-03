package com.board.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.board.spring.common.Comm;
import com.board.spring.dao.CommentDao;
import com.board.spring.model.CommentVO;

/**
 * 댓글 Service Implements
 * @author 유지상
 */
@Service
@PropertySource("classpath:config/config.properties") //프로퍼티 읽어오기 위한 경로설정
public class CommentServiceImp implements CommentService{
	
	@Autowired //게시판 DAO
	CommentDao commentDao;
	
	
	@Autowired // 프로터피 읽어오기 위한 객체
	private Environment env;
	
	
	@Override //게시글 리스트 조회
	public List<CommentVO> getCommentList(Map<String, Object> pageInfoMap, int boardIdx) {
		return commentDao.selectCommentList(pageInfoMap, boardIdx);
	}
	
	@Override
	public boolean addComment(CommentVO comment) {
		boolean result = false;
		
		if(0 < commentDao.insertComment(comment)) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean modifyComment(CommentVO comment) {
		boolean result = false;
		
		if(0 < commentDao.updateComment(comment)) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean deleteComment(int commentIdx) {
		boolean result = false;
		
		if(0 < commentDao.deleteComment(commentIdx)) {
			result = true;
		}
		return result;
	}
	
	@Override //페이지 정보 셋팅
	public Map<String, Object> setPageInfo(int currentPage, int totalCount, String keyword, String type){
		// 한페이지에 보여질 게시글 갯수
		int pageListCount = Integer.parseInt(env.getProperty("page_list_count"));
		// 한번에 보여줄 페이지 네비게이터에 갯수(한줄에 몇개의 페이지번호 표출 할 것인지)
		int pageNavCount = Integer.parseInt(env.getProperty("page_nav_count"));
		
		/* 페이지 정보 셋팅
		 * 현제 페이지 번호, 전체 게시글 갯수, 한페이지에 보여질 게시글 갯수, 한번에 보여줄 페이지 네비게이터에 갯수
		 */
		Map<String, Object> pageInfoMap = 
				Comm.setPageInfo(currentPage, totalCount, pageListCount, pageNavCount, keyword, type);
		
		
		return pageInfoMap;
	}

}