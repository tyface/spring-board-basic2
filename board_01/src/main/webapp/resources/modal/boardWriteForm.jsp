<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- 모달 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<!-- 암호화 기능 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/encryption/encryption.js"></script>
<!-- 암호화 관련 라이브러리 -->
<script src="${pageContext.request.contextPath}/resources/js/encryption/jsbn.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/encryption/prng4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/encryption/rng.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/encryption/rsa.js"></script>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
  <h4 class="modal-title" id="myModalLabel">게시글 추가</h4>
</div>

<form role="form" id="writeForm">
	<div class="modal-body">
		  <div class="form-group">
		    <label for="title" class="control-label">제목:</label>
		    <input type="text" class="form-control" id="title" minlength="1" maxlength="50" required>
		  </div>
		  <div class="form-group">
		    <label for="name" class="control-label">작성자:</label>
		    <input type="text" class="form-control" id="name" minlength="1" maxlength="20" required>
		  </div>
		  <div class="form-group">
		    <label for="password" class="control-label">비밀번호:</label>
		    <input type="password" class="form-control" id="password" minlength="4" maxlength="20" required>
		  </div>
		  <div class="form-group">
		    <label for="contnets" class="control-label">내용:</label>
		    <textarea class="form-control" id="contents" rows="8" minlength="1" maxlength="2500" required></textarea>
		  </div>
	</div>

	<div class="modal-footer">
	   <input type="submit" class="btn btn-primary submit" value="게시글 추가">
	   <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	</div>
</form>


	