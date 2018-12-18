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
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
  
  <script type="text/javascript">
  	
  	/* 게시글 리스트 페이지로 이동 */
		function viewBoardList(){
			location.href = "${pageContext.request.contextPath}";
	  }
	  
  	/* 게시글 상세보기에서 게시글 수정으로 전환*/
		function modifyBoardForm(boardIdx){
			passwordCheck = prompt("비밀번호를 입력해 주세요");
			
			if($("#password").val() == passwordCheck){
				$("#passwordForm").show();
				$("#modifySecBtn").show();
				$("#modifyBtn").hide();
				$("#title").removeAttr("readonly"); 
				$("#name").removeAttr("readonly"); 
				$("#contents").removeAttr("readonly"); 
			}else{
				alert("비밀번호가 일치하지 않습니다.")
			}
	  }
	
  	/* 게시글 삭제 */
	  function deleteBoard(boardIdx){
		  passwordCheck = prompt("비밀번호를 입력해 주세요");
		  
		  if($("#password").val() == passwordCheck){
			  location.href = "${pageContext.request.contextPath}/deleteBoard?boardIdx=" + boardIdx;
			}else{
				alert("비밀번호가 일치하지 않습니다.")
			}
		  
		  
	  }
  </script>
</head>

<body>

	<div class="container">
	  <h2 align="center">게시글 상세보기</h2><br><br>
	  <form class="form-horizontal" action="${pageContext.request.contextPath}/modifyBoard" method="POST">
	  	<input type = "hidden" name="boardIdx" value="${board.boardIdx}">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="title">제목:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">작성자:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="name" name="name" value="${board.name}" readonly>
	      </div>
	    </div>
	    <div class="form-group" id="passwordForm" style="display:none">
	      <label class="control-label col-sm-2" for="password">비밀번호:</label>
	      <div class="col-sm-10">          
	        <input type="password" class="form-control" id="password" name="password" value="${board.password}">
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
	        <textarea class="form-control" id="contents" name="contents" rows="10" readonly>${board.contents}</textarea>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-primary" id="modifySecBtn" style="display:none">수정 완료</button>
	        <button type="button" class="btn btn-default" onclick="modifyBoardForm(${board.boardIdx})" id="modifyBtn">수정</button>
	        <button type="button" class="btn btn-default" onclick="deleteBoard(${board.boardIdx})">삭제</button>
	        <button type="button" class="btn btn-primary" style="float:right" onclick="viewBoardList()">목록</button>
	      </div>
	    </div>
	  </form>
	</div>

</body>
</html>
