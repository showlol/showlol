<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
	a{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<script src="/ckeditor/ckeditor.js"></script>
<link href="/css/tactics.css" rel="stylesheet">
<title>공략 글쓰기</title>
</head>
<form action="/tactics/write2" method='post' onsubmit="return transferTactics();">
<div>
	<img class="img-rounded" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${champData.image1}" >
	<input name='title' style="display: inline-block; width: 300px; height: 115px; background-color: #E7E3F0;
		border-radius: 4%; padding: 10px; " placeholder="제목을 작성해 주세요" required="required" value='${tactics.title }' >
			
	
	<input type='hidden' name='champ' value='${champData.name }' />
	<input type='hidden' name='writer' value='${nick }' />	
	<ul class="nav nav-tabs">
		<li class="active"><a a data-toggle="tab" href="#mastery">특성</a>
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
			<c:import url="tactics/items.jsp" />
		</div>
	</div>	
	<hr style="clear: left;">
</div>
<input type="submit" value="등록" class="btn-sm btn-primary" />
	<input type="hidden" name="skillBuild" />
	<input type="hidden" name="masteryData" value=""/>	
	<input type='hidden' name='itemBuild' value="" />
	<input type='hidden' name='runeData' />
	
</form>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {		
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
			
		});			
	});
	
	function transferTactics() {
		var masteryData = ""; //마스터리는 1부터 30까지
		for (i = 1; i <= 45; i++) {
			masteryData += $("#" + i).children("#point").html() + "#";
		}
		var runeData = "";
		for (i = 0; i < 30; i++) {
			runeData += $("#runeNum" + i).children("div:first").attr("value")
					+ "#";
		}
		var skillBuild = "";
		$("#skillTree").children("img").each(function(elt){
			skillBuild += this.getAttribute("info")+"#";
		});
		var itemBuild = "";
		$("#itemTree").children("img").each(function(elt){
			itemBuild += this.getAttribute("info")+"#";
		});
		$("[name=masteryData]").val(masteryData);
		$("[name=runeData]").val(runeData);
		$("[name=skillBuild]").val(skillBuild);
		$("[name=itemBuild]").val(itemBuild);		
		return true;
	}
	
</script>