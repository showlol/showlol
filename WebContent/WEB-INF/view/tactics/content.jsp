<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link href="/css/tactics.css" rel="stylesheet">
<title>공략 글쓰기</title>
</head>
<form id='tacticsModForm' action="/tactics/write2" method='post' onsubmit="return transferTactics();">
<div>	
	<H3 style="font-family: 'Nanum Gothic', sans-serif;">${tactics.champ } 공략글 </H3>
	<img class="img-rounded" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${champData.image1}" >
	<div style="display: inline-block; width: 300px; height: 115px; background-color: #E7E3F0;
		border-radius: 4%; padding: 10px; ">
		<b style="display: inline; font-family: 'Nanum Gothic', sans-serif;">${tactics.title }</b><br/>	
		<span style="float: right; font-family: 'Nanum Gothic', sans-serif;">작성자 : ${tactics.writer }</span><br/>
		<span style="float: right; font-family: 'Nanum Gothic', sans-serif;">${tactics.writeDate }</span><br/>
	</div>	
	<ul class="nav nav-tabs">
		<li class="active"><a href="#mastery">특성</a>
		<li><a href="#rune">룬</a>
		<li><a href="#skill">스킬</a>
		<li><a href="#items">아이템</a>
	</ul>
	<div class="tab-content">	
		<div id="mastery" class="tab-pane fade in active ">
			<c:import url="tactics/mastery.jsp" />
		</div>
		<div id="rune" class="tab-pane fade in">
			<c:import url="tactics/rune.jsp" />
		</div>
		<div id="skill" class="tab-pane fade in">
			<c:import url="tactics/skills.jsp" />
		</div>
		<div id="items" class="tab-pane fade in">
		</div>
	</div>	
	<hr style="clear: left;">
</div>
<input type="submit" value="등록" />
</form>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var detailItems;
	console.log(detailItems);
	
	$(document).ready(function() {		
		$(".nav-tabs a").click(function() {
			if(this.getAttribute("href")=="#items" && detailItems==undefined){
				$.ajax("/module/readItems.jsp?num="+${tactics.num}).done(function(r){
					$("#items").append(r);
				});
			}
			$(this).tab('show');
			
		});			
	});	
	
	function transferTactics(){
		$("#tacticsModForm").append("<input type='text' name='champ' value='${champData.key }' />");
		$("#tacticsModForm").append("<input type='text' name='writer' value='${nick }' />");
		$.ajax({
			url : "/js/mastery/transferTactics.js",			
			async : false
		}).done(function(r){			
			return true;
		});
		return false;
	}
</script>
