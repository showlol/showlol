<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="/ckeditor/ckeditor.js"></script>
<link href="/css/tactics.css" rel="stylesheet">
<link rel='stylesheet' href='/css/tactics/runeSetting.css' >
<script>var champKey = "${champKey}";
		console.log("modi테스트:"+champKey)
	</script>
<title>공략 글쓰기</title>
</head>
<style>
	a{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<div id='centerDiv' style='margin: 0 15%;'>
	<form action="/tactics/writeUpdate2" id='tacticsModForm' method="post" onsubmit='return transferTactics();' >
	
		<img class="img-rounded" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${sessionScope.champData.image1}" >
		<input name='title' style="display: inline-block; width: 300px; height: 115px; background-color: #E7E3F0;
			border-radius: 4%; padding: 10px; " value='${tactics.title }' required >
		
		<input type='hidden' name='champ' value='${sessionScope.tactics.champ }' />
		<input type='hidden' name='writer' value='${nick }' />	
		<div class='well' style='width: 650px; margin: 8px 0'>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#mastery">특성</a>
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
		</div>	
		<input type='hidden' name='num' value='${tactics.num }' >
		<input type="submit" value="등록" class="btn-sm btn-primary" />
	</form>
</div>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var masteryData = "${tactics.masteryData}".split("#");
	var runeData  = "${tactics.runeData}".split("#");
	var skillBuild = "${tactics.skillBuild}".split("#");
	var itemBuild = "${tactics.itemBuild}".split("#");
	var tacticsClass = ["mastery", "rune", "skill", "item"];
	var champKey="${champData.key}";
</script>	
<script src="/js/tactics/read/masteryRead.js"></script>
<script src="/js/tactics/read/runeRead.js"></script>
<script src="/js/tactics/read/skillRead.js"></script>	
<script src="/js/tactics/read/itemRead.js"></script>
<script>
	$(document).ready(function() {		
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
			
		});		
		masteryCalculation();
	});	
// 	$("#mastery_ul").find(".attrBox").each(function(){
// 		var span = $(this).children("span#point")[0];
// 		console.log(span);
// 	});	
	
	console.log("totalPoint:"+totalPoint);
	
	function masteryCalculation(){
		var masteryData = ""; //마스터리는 1부터 30까지
		for (i = 1; i <= 45; i++) {
			masteryData += $("#" + i).children("#point").html() + "#";
		}
		
	}
	
	function transferTactics() {
		var isSendable=false;
		console.log(this);
		$.ajax({
			url: "/js/mastery/transferTactics.js",
			async: false
		}).done(function(r){
			isSendable = true 
		}).fail(function(r){
			alert('데이터 처리 실패');
			console.log(r);
			return false;
		});
		return isSendable;
	}
	
</script>