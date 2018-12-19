var action = '';
var url = '';
var type = '';
var bno = '';

$(function(){
	
	$("#writeForm").submit(function(){
		
		url = "writeBoard";
		type = "POST";
		
		var data = {
			"title" : $("#title").val(),
			"name" : $("#name").val(),
			"password" : $("#password").val(),
			"contents" : $("#contents").val()
		};
		
		$.ajax({
			url : url,
			type : type,
			data : data,
			success : function(){
				$("#writeForm").modal('toggle');
				alert("게시글 등록 완료");
			},
			error: function(){
				alert("게시글 등록 실패");
			},
			complete : function(){location.reload();}
		})
	})
	
});