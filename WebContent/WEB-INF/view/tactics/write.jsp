<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>  
    <title>공략 글쓰기</title>
</head>

       
<body>
	<form id="reg" method="post">
		작성자: <input type="text" name="writer" id="writer" value="aa"><br/>
		제목 : <input type="text" name="title" id="title" >
		<textarea name="content1" id="content1"></textarea>
	    <script>CKEDITOR.replace( 'content1' );</script>
	   	<input type="submit" id="submit" value="입력" >
	</form>
	<button id="wr" >wr</button>	
</body>

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
						writer : $("#writer").val(),
						title : $("#title").val(),
						content1 : CKEDITOR.instances.content1.getData()
					},		
		}).done(function(r){
			alert(r);
		});
		
	}
</script>