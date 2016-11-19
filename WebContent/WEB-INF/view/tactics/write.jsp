<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="/ckeditor/ckeditor.js"></script>  
    <title>공략 글쓰기</title>
</head>
<div class="container">
<ul class="nav nav-tabs">
	<li class="active"><a href="#mastery">특성</a>
	<li><a href="#rune">룬</a>
	<li><a href="#skill">스킬</a>
	<li><a href="#item">아이템</a>
</ul>

	<div id="mastery" class="tab-pane fade in active">
	특성
	</div>
	<div id="rune" class="tab-pane fade ">
		rune
	</div>
	<div id="skill" class="tab-pane fade">
		skill
	</div>
	<div id="items" class="tab-pane fade">
		items
	</div>

  <hr>
    <p class="act"><b>Active Tab</b>: <span></span></p>
    <p class="prev"><b>Previous Tab</b>: <span></span></p>
</div>

<h4>${param.champ } 공략 쓰기</h4>
<form id="reg" method="post">
	제목 : <input type="text" name="title" id="title">
	<textarea name="content1" id="content1"></textarea>
	<script>CKEDITOR.replace('content1');
	</script>
</form>
<button id="wr">글쓰기</button><br/>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>	
	$(document).ready(function(){
		$("#wr").click(function(){			
			write();
		});
		
		$(".nav-tabs a").click(function(){
 	        $(this).tab("show");
	    });
	    $('.nav-tabs a').on('shown.bs.tab', function(event){
	        var x = $(event.target).text();         // active tab
	        var y = $(event.relatedTarget).text();  // previous tab
	        $(".act span").text(x);
	        $(".prev span").text(y);
	    });
	});	
	
	function tabControll(){
		
	}
	
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