<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
  <h4 class="modal-title" id="myModalLabel">게시글 추가</h4>
</div>

<div class="modal-body">
	<form role="form" method="post" id="writeForm">
	  <div class="form-group">
	    <label for="title" class="control-label">제목:</label>
	    <input type="text" class="form-control" id="title">
	  </div>
	  <div class="form-group">
	    <label for="name" class="control-label">작성자:</label>
	    <input type="text" class="form-control" id="name">
	  </div>
	  <div class="form-group">
	    <label for="password" class="control-label">비밀번호:</label>
	    <input type="password" class="form-control" id="password">
	  </div>
	  <div class="form-group">
	    <label for="contnets" class="control-label">내용:</label>
	    <textarea class="form-control" id="contents" rows="8"></textarea>
	  </div>
	</form>
</div>

<div class="modal-footer">
   <button type="button" class="btn btn-primary" id="writeBoard">작성 완료</button>
   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>