package com.board.spring.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.board.spring.model.BoardVO;

/**
 * 게시글 DAO
 * @author 유지상
 */
@Repository
public interface BoardDao {
	
	// 게시글 리스트 조회
	public List<BoardVO> selectBoardList(Map<String, Integer> pageInfoMap);
	
	// 검색 게시글 조회
	public List<BoardVO> selectBoardByKeyword(Map<String, Object> data);
	
	// 게시글 조회
	public BoardVO selectOneBoard(int boardIdx);
	
	// 게시글 추가
	public int insertBoard(BoardVO board);
	
	// 게시글 수정
	public int updateBoard(BoardVO board);
	
	// 게시글 삭제
	public int deleteBoard(int boardIdx);
	
	// 전체 게시글 갯수 카운트
	public int selectAllCount(); 
	
	// 검색 게시글 갯수 카운트
	public int selectCountByKeyword(Map<String, Object> data); 
		
	// 비밀번호 확인
	public String selectPassword(int boardIdx);
}