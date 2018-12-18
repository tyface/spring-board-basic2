package com.board.spring.model;

import java.sql.Timestamp;

/**
 * 게시글 VO
 * @author 유지상
 */
public class BoardVO {
	
	private int rowNum; 		// 줄번호 번호
	private int boardIdx; 		// 게시글 번호
	private String title; 		// 제목
	private String name; 		// 작성자
	private String password; 	// 비밀번호
	private String contents; 	// 내용
	private Timestamp regDate;	// 작성일

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Board [rowNum = "+ rowNum + ", boardIdx=" + boardIdx + ", title=" + title + ", name=" + name + ", password=" + password
				+ ", contents=" + contents + ", regDate=" + regDate + "]";
	}
}
