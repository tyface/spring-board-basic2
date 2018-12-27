var action = '';
var url = '';
var type = '';
var bno = '';

$(function(){
	
	$("#writeForm").submit(function(){
		//비밀번호 암호화 (RSA)
		var encPassword = fnRsaEnc($("#password").val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
		
		url = "writeBoard";
		type = "POST";
		
		var data = {
			"title" : $("#title").val(),
			"name" : $("#name").val(),
			"password" : encPassword,
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
			complete : function(){
				location.reload();
			}
			
		})
		return false;
	})
	
});