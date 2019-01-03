package com.board.spring.model;

/**
 * 댓글 VO
 * @author 유지상
 */
public class CommentVO {
	
	private int commentIdx; 		// 댓글 일련번호
	private int referenceIdx; 		// 참조 댓글 일련번호
	private String name; 		// 작성자
	private String password; 	// 비밀번호
	private String comment; 		// 댓글 내용
	private String regDate;	// 작성일
	
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
	public int getReferenceIdx() {
		return referenceIdx;
	}
	public void setReferenceIdx(int referenceIdx) {
		this.referenceIdx = referenceIdx;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [commentIdx=" + commentIdx + ", referenceIdx=" + referenceIdx + ", name=" + name
				+ ", password=" + password + ", comment=" + comment + ", regDate=" + regDate + "]";
	}

}
