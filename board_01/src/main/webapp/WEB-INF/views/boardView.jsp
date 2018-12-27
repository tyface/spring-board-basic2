<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- 암호화 기능 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/encryption/encryption.js"></script>
	<!-- 암호화 관련 라이브러리 -->
	<script src="${pageContext.request.contextPath}/resources/js/encryption/jsbn.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/encryption/prng4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/encryption/rng.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/encryption/rsa.js"></script>

  <script type="text/javascript">
		var rsaPublicKeyModulus = '${publicKeyModulus}';
  	var rsaPublicKeyExponent = '${publicKeyExponent}';
  	
  	/* 게시글 리스트 페이지로 이동 */
		function viewBoardList(){
  		
			location.href = "${pageContext.request.contextPath}/?currentPage=${currentPage}";
	  }
	  
  	/* 게시글 상세보기에서 게시글 수정으로 전환*/
		function modifyBoardForm(boardIdx){
  		
			passwordCheck = prompt("비밀번호를 입력해 주세요");
			
			url = "checkPassword";
			type = "POST";
			
			var data = {
				"boardIdx" : $("#boardIdx").val(),
				"password" : passwordCheck
			};
			
			$.ajax({
				url : url,
				type : type,
				data : data,
				success : function(result){
					
					if(result == "true"){
						$("#passwordForm").show();
						$("#modifySecBtn").show();
						$("#modifyBtn").hide();
						$("#title").removeAttr("readonly"); 
						$("#name").removeAttr("readonly"); 
						$("#contents").removeAttr("readonly");
					}else{
						alert("비밀번호가 일치하지 않습니다.")
					}
				},
				error: function(){
					alert("비밀번호가 일치하지 않습니다.")
				},
				complete : function(){}
			});
			return false;
	  }
	
  	/* 게시글 삭제 */
	  function deleteBoard(boardIdx, currentPage){
		  passwordCheck = prompt("비밀번호를 입력해 주세요");
		  
		  url = "checkPassword";
			type = "POST";
			
			var data = {
				"boardIdx" : $("#boardIdx").val(),
				"password" : passwordCheck
			};
			
			$.ajax({
				url : url,
				type : type,
				data : data,
				success : function(result){
					
					if(result == "true"){
						location.href = "${pageContext.request.contextPath}/deleteBoard?boardIdx=" + boardIdx + "&currentPage=" + currentPage;
					}else{
						alert("비밀번호가 일치하지 않습니다.")
					}
				},
				error: function(){
					alert("비밀번호가 일치하지 않습니다.")
				},
				complete : function(){}
			});
			return false;
	  }
  </script>
</head>

<body>

	<div class="container">
	  <h2 align="center">게시글 상세보기</h2><br><br>
	  <form class="form-horizontal" action="${pageContext.request.contextPath}/modifyBoard" method="POST">
	  	<input type = "hidden" id="boardIdx" name="boardIdx" value="${board.boardIdx}">
	  	<input type = "hidden" id="password" name="password" value="${board.password}">
	  	<input type = "hidden" name="currentPage" value="${currentPage}">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="title">제목:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="title" name="title" value="${board.title}" minlength="2" required readonly>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">작성자:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="name" name="name" value="${board.name}" minlength="1" required readonly>
	      </div>
	    </div>
	    <div class="form-group" id="passwordForm" style="display:none">
	      <label class="control-label col-sm-2" for="newPassword">비밀번호:</label>
	      <div class="col-sm-10">          
	        <input type="password" class="form-control" id="newPassword" name="newPassword" minlength="4">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="regDate">작성일:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="regDate" name="regDate" value="${board.regDate}" readonly>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">내용:</label>
	      <div class="col-sm-10">          
	        <textarea class="form-control" id="contents" name="contents" rows="10" minlength="2" required readonly>${board.contents}</textarea>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-primary" id="modifySecBtn" style="display:none">수정 완료</button>
	        <button type="button" class="btn btn-default" onclick="modifyBoardForm(${board.boardIdx}, ${currentPage})" id="modifyBtn">수정</button>
	        <button type="button" class="btn btn-default" onclick="deleteBoard(${board.boardIdx}, ${currentPage})">삭제</button>
	        <button type="button" class="btn btn-primary" style="float:right" onclick="viewBoardList(${currentPage})">목록</button>
	      </div>
	    </div>
	  </form>
	</div>

</body>
</html>
