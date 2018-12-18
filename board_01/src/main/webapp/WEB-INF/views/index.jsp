<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>게시판 테스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
  
  <script type="text/javascript">
  	/* 게시글 상세보기 */
  	function readBoard(boardNum){
  		location.href = "${pageContext.request.contextPath}" + "/readBoard?boardNum=" + boardNum;
  	}
  	
  </script>
</head>

<body>

<div class="container">
	<h2 align="center">게시판</h2><br><br>
  
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
    
	    <c:forEach var="board" items="${boardList}">
				<tr>
	    		<td class="col-xs-1">${board.boardNum}</td>
       		<td class="col-xs-5" onclick="readBoard(${board.boardNum})">${board.title}</td>
       		<td class="col-xs-2">${board.name}</td>
       		<td class="col-xs-4">${board.regDate}</td>
		    </tr>
			</c:forEach>
			
    </tbody>
  </table>
  
	<nav aria-label="Page navigation example" style="text-align:center">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.request.contextPath}/?pageNum=${pageInfo.prevPage}" aria-label="Previous">
	        <span aria-hidden="true"> &laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    
	    <c:forEach begin="${pageInfo.firstPage}" end="${pageInfo.lastPage}" step="1" var="pageNum">
	    
	    	<c:set var="nowPage" value="${pageInfo.pageNum}"/>
		    	<c:choose>
			    	<c:when test="${nowPage eq pageNum}">
			    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/?pageNum=${pageNum}"><b>${pageNum}</b></a></li>
			    	</c:when>
			    	
			    	<c:otherwise>
			    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/?pageNum=${pageNum}">${pageNum}</a></li>
			    	</c:otherwise>
		    	</c:choose>
	    	
	    </c:forEach>
	    
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.request.contextPath}/?pageNum=${pageInfo.nextPage}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
  
  <!-- 게시클 추가버튼(모달 오픈) -->
  <button style="float:right;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#writeForm">게시글 추가</button>
	<!-- 글쓰기 모달 -->
	<div class="modal fade" id="writeForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
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
	    </div>
	  </div>
	</div>
	
</div>

</body>
</html>
