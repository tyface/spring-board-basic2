package com.board.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.board.spring.model.BoardVO;

/**
 * 게시판 Service
 * @author 유지상
 */
@Service
public interface BoardService {

	// 게시글 리스트 가져오기
	public List<BoardVO> getBoardList(Map<String, Integer> pageInfoMap);

	// 게시글 가져오기
	public BoardVO getBoard(int boardIdx);

	// 게시글 추가
	public boolean addBoard(BoardVO board);
	
	// 게시글 수정
	public boolean modifyBoard(BoardVO board);

	// 게시글 삭제
	public boolean deleteBoard(int boardIdx);

	// 페이지 정보 셋팅
	public Map<String, Integer> setPageInfo(int currentPage);
}