<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="/ckeditor/ckeditor.js"></script>  
    <title>공략 글쓰기</title>
</head>
<div>
	<ul class="nav nav-tabs">
		<li class="active"><a a data-toggle="tab" href="#mastery">특성</a>
		<li><a href="#rune">룬</a>
		<li><a href="#skill">스킬</a>
		<li><a href="#items">아이템</a>
	</ul>
	<div class="tab-content">
		<div id="mastery" class="tab-pane fade in active " >
			<c:import url="tactics/mastery.jsp" />
		</div>
		<div id="rune" class="tab-pane fade in" >
			<c:import url="tactics/rune.jsp" />
		</div>
		<div id="skill" class="tab-pane fade in" >
			<c:import url="tactics/skills.jsp" />
		</div>
		<div id="items" class="tab-pane fade in" >
			<c:import url="tactics/items.jsp" />		
		</div>
	</div>
  <hr style="clear: left;">
   
</div>

<h4>${param.champ } 공략 쓰기</h4>
<form id="reg" method="post">
	제목 : <input type="text" name="title" id="title">
	<textarea name="content1" id="content1"></textarea>
	<script>CKEDITOR.replace('content1');
	</script>
</form>
<button id="wr">글쓰기</button><br/>
<button id="md">마스터리</button>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>	
	$(document).ready(function(){
		$("#wr").click(function(){		
			write();
		});		
		$(".nav-tabs a").click(function(){		
		    $(this).tab('show');
		});
		$("#md").click(function(){
			masteryData();
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
	function masteryData(){
		var masteryData="";
		for(i=0; i<30; i++){
			masteryData+=$("#"+i).children("#point").html()+"#";
		}
		console.log(masteryData);
	}
	function runeData(){
		
	}

</script>