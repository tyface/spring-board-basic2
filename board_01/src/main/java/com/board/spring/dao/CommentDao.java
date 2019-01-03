package com.board.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.board.spring.model.BoardVO;
import com.board.spring.model.CommentVO;

/**
 * 댓글 DAO
 * @author 유지상
 */
@Repository
public interface CommentDao {
	
	// 댓글 리스트 조회
	public List<CommentVO> selectCommentList(Map<String, Object> pageInfoMap, @Param("boardIdx")int boardIdx);
	
	// 댓글 추가
	public int insertComment(CommentVO comment);
	
	// 댓글 수정
	public int updateComment(CommentVO comment);
	
	// 댓글 삭제
	public int deleteComment(int commentIdx);
}