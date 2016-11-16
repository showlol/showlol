<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>  
    <title>공략 글쓰기</title>
</head>

<h4>${param.champ } 공략 쓰기</h4>
<form id="reg" method="post">
	제목 : <input type="text" name="title" id="title">
	<textarea name="content1" id="content1"></textarea>
	<script>CKEDITOR.replace('content1');
	</script>
</form>
<button id="wr">글쓰기</button>

<script>	
	$(document).ready(function(){
		$("#wr").click(function(){			
			write();
		});
	});
	
	
	function write(){		
		$.ajax({
			type : "POST",
			url : "/tactics/write",
			data : {
						writer : "${nick }",
						champ : "${param.champ }",
						title : $("#title").val(),
						content1 : CKEDITOR.instances.content1.getData()
					},		
		}).done(function(r){
			location.href="/tactics/"
		});
		
	}
</script>