package com.board.spring.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.board.spring.common.Comm;
import com.board.spring.dao.BoardDao;
import com.board.spring.model.BoardVO;

/**
 * 게시판 Service Implements
 * @author 유지상
 */
@Service
@PropertySource("classpath:config/config.properties") //프로퍼티 읽어오기 위한 경로설정
public class BoardServiceImp implements BoardService{
	
	@Autowired //게시판 DAO
	BoardDao boardDao;
	
	
	@Autowired // 프로터피 읽어오기 위한 객체
	private Environment env;
	
	
	@Override //게시글 리스트 조회
	public List<BoardVO> getBoardList(Map<String, Integer> pageInfoMap) {
		List<BoardVO> boardList = boardDao.selectBoardList(pageInfoMap);
		
		return boardList;
	}

	@Override //게시글 조회
	public BoardVO getBoard(int boardIdx) {
		BoardVO board = boardDao.selectOneBoard(boardIdx);
		
		return board;
	}

	@Override //게시글 추가
	public boolean addBoard(BoardVO board) {
		boolean result = false;
		
		//비밀번호 암호화
		board.setPassword(BCrypt.hashpw(board.getPassword(), BCrypt.gensalt(10)));
		
		if(0 < boardDao.insertBoard(board)) {
			result = true;
		}
		
		return result;
	}

	@Override //게시글 수정
	public boolean modifyBoard(BoardVO board) {
		boolean result = false;
		
		if(0 < boardDao.updateBoard(board)) {
			result = true;
		}
		
		return result;
	}

	@Override //게시글 삭제
	public boolean deleteBoard(int boardIdx) {
		boolean result = false;
		
		if(0 < boardDao.deleteBoard(boardIdx)) {
			result = true;
		}
		
		return result;
	}
	
	@Override //비밀번호 확인
	public boolean checkPassword(int boardIdx, String password) {
		boolean result = false;
		
		// 데이터베이스에 있는 비밀번호
		String sPassword = boardDao.selectPassword(boardIdx);
		
		// 입력받은 비밀번호와 암호화되어 저장되어있는 비밀번호를 검증
		boolean isValidPassword = BCrypt.checkpw(password, sPassword);
		
		if(isValidPassword) {
			result = true;
		}
		
		return result;
	}
	
	@Override //페이지 정보 셋팅
	public Map<String, Integer> setPageInfo(int currentPage){
		// 한페이지에 보여질 게시글 갯수
		int pageListCount = Integer.parseInt(env.getProperty("page_list_count"));
		// 한번에 보여줄 페이지 네비게이터에 갯수(한줄에 몇개의 페이지번호 표출 할 것인지)
		int pageNavCount = Integer.parseInt(env.getProperty("page_nav_count"));
		
		/* 페이지 정보 셋팅
		 * 현제 페이지 번호, 전체 게시글 갯수, 한페이지에 보여질 게시글 갯수, 한번에 보여줄 페이지 네비게이터에 갯수
		 */
		Map<String, Integer> pageInfoMap = 
				Comm.setPageInfo(currentPage, boardDao.selectAllCount(), pageListCount, pageNavCount);
		
		
		return pageInfoMap;
	}
}