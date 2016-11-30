<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="/ckeditor/ckeditor.js"></script>
<link href="/css/tactics.css" rel="stylesheet">
<title>공략 글 수정</title>
</head>
${tactics.champ } 공략글 
<form action="/tactics/modify" method='post' onsubmit="return transferTactics();">
<div>
	<input type='text' name='title' required='required' placeholder="제목을 입력해 주세요" />
	<input type='hidden' name='champ' value='${param.champ }' />
	<input type='hidden' name='writer' value='${nick }' />	
	<ul class="nav nav-tabs">
		<li class="active"><a a data-toggle="tab" href="#mastery">특성</a>
		<li><a href="#rune">룬</a>
		<li><a href="#skill">스킬</a>
		<li><a href="#items">아이템</a>
	</ul>
	<div class="tab-content">	
		<div id="mastery" class="tab-pane fade in active ">
			<c:import url="/WEB-INF/view/tactics/mastery.jsp" />
		</div>
		<div id="rune" class="tab-pane fade in">
			<c:import url="/WEB-INF/view/tactics/rune.jsp" />
		</div>
		<div id="skill" class="tab-pane fade in">
			<c:import url="/WEB-INF/view/tactics/skills.jsp" />
		</div>
		<div id="items" class="tab-pane fade in">
			<c:import url="/WEB-INF/view/tactics/items.jsp" />
		</div>
	</div>	
	<hr style="clear: left;">
</div>
<input type="submit" value="등록" class="btn-sm btn-primary" />
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
		$("[name=masteryData]").val(masteryData);
		$("[name=skillBuild]").val(skillBuild);
		$("[name=runeData]").val(runeData);
		$("[name=itemBuild]").val(itemBuild);		
		return true;
	}	
</script>