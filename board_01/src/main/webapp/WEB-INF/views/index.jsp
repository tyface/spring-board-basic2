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
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">
  	var rsaPublicKeyModulus = '${publicKeyModulus}';
  	var rsaPublicKeyExponent = '${publicKeyExponent}';
  	
  	/* 게시글 상세보기 */ 
  	function readBoard(boardIdx, currentPage){ //	게시글 번호 , 현제 페이지
  		location.href = "${pageContext.request.contextPath}" + "/readBoard?boardIdx=" + boardIdx + "&currentPage=" + currentPage;
  	}
  	
  	function paging(pageNum){
  		var form = document.createElement("form");
  		
  		path = "${pageContext.request.contextPath}/";
  		method = "post"; 
 	    params = {"currentPage": pageNum,
 	    					"keyword": "${pageInfo.keyword}",
 	    					"type":	"${pageInfo.type}",
 	    					};
 	    console.log(params);
 	    form.setAttribute("method", method);
 	    form.setAttribute("action", path);
 	    
 	    for(var key in params) {
 	        var hiddenField = document.createElement("input");
 	        hiddenField.setAttribute("type", "hidden");
 	        hiddenField.setAttribute("name", key);
 	        hiddenField.setAttribute("value", params[key]);
 	        form.appendChild(hiddenField);
 	    }
 	    
 	    document.body.appendChild(form);
 	    form.submit();
  	}
  </script>
</head>

<body>
	<div class="container">
		<h2 align="center">게시판</h2><br><br>
	  
	  <!-- 게시글 리스트 -->
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
		    		<td class="col-xs-1">${board.rowNum}</td>
	       		<td class="col-xs-5" onclick="readBoard(${board.boardIdx}, ${pageInfo.currentPage})">${board.title}</td>
	       		<td class="col-xs-2">${board.name}</td>
	       		<td class="col-xs-4">${board.regDate}</td>
			    </tr>
				</c:forEach>
	    </tbody>
	  </table>
	  
	  <!-- 검색바 -->
	
	  <div class="row">
		  <div class="col-xs-offset-3 col-xs-6">
		    <form action="${pageContext.request.contextPath}/" method="post">
			    <div class="input-group">
			    	<div class="input-group-btn">
				      <select class="form-control" id="searchType" name="type" style="width:100px;"> 
						    <option value="title">제목</option> 
						    <option value="contents">내용</option> 
						    <option value="name">작성자</option> 
					    </select>
				    </div>
			      <input type="text" class="form-control" placeholder="Search for..." id="searchWord" name="keyword">
			      <span class="input-group-btn">
			        <input type="submit" class="btn btn-default" id="searchBtn" value="검색">
			      </span>
			    </div>
		    </form>
		  </div>
		</div>
	
	  <!-- 페이지 네비게이션 --> 
		<nav aria-label="Page navigation example" style="text-align:center">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" onclick="paging(${pageInfo.prevPage})" aria-label="Previous">
		        <span aria-hidden="true"> &laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pageInfo.firstPage}" end="${pageInfo.lastPage}" step="1" var="currentPage">
		    	<c:set var="nowPage" value="${pageInfo.currentPage}"/>
		    	<c:choose>
			    	<c:when test="${nowPage eq currentPage}">
			    		<li class="page-item"><a class="page-link" onclick="paging(${currentPage})"><b>${currentPage}</b></a></li>
			    	</c:when>
			    	<c:otherwise>
			    		<li class="page-item"><a class="page-link" onclick="paging(${currentPage})">${currentPage}</a></li>
			    	</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    
		    <li class="page-item">
		      <a class="page-link" onclick="paging(${pageInfo.nextPage})" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	  
	  <!-- 게시클 추가버튼(모달 오픈) -->
	  <button style="float:right;" type="button" data-remote="resources/modal/boardWriteForm.jsp" 
	  				class="btn btn-primary btn-lg" data-toggle="modal" data-target="#writeForm">게시글 추가</button>
	  				
		<!-- Start 글쓰기 모달 -->
		<div class="modal fade" id="writeForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      
		    </div>
		  </div>
		</div>
		<!-- End 글쓰기 모달 -->
		
	</div>
</body>

</html>
