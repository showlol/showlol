<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
	<div style="float: left;">
		<select id="runeKind">
			<option>룬선택</option>
			<option>표식</option>
			<option>인장</option>
			<option>문양</option>
			<option>정수</option>
		</select>

		<div id="runeSelector" style="height: 250px; overflow-y: auto;">
			룬 게터<br />
			<div id='rune' type='red' data='5534'
				style='height: 40px; width: 40px; background-image: url("http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/y_4_3.png"); background-size: cover;'>
			</div>
			<br />
		</div>
	</div>
	<div id="runeSetter"
		style="white-space: nowrap; height: 300px; max-width: 550px; overflow: auto; background-color: #eae179;">
		<c:forEach var="i" begin="0" end="29">
			<div id="runeNum${i }" class="runeBox" data="empty"></div>
			<c:if test="${i%10==9 }">
				<br />
			</c:if>
		</c:forEach>
	</div>
	<div id="runeAbility"></div>
	<div style="clear: left;">
		<h4>${param.champ }의룬 공략</h4>
		<input type='hidden' name='runeData' />
		<textarea name="runeContent" id="runeContent"></textarea>
		<script>CKEDITOR.replace('runeContent');</script>
	</div>
<script>
	
	var runeList = [];
	var runeJSON = {};
	var runeKind = {};
	var runeAbil = {};
	$("rune.jsp").ready(function(){
		$("#runeSelector, #runeSetter").click(function(e){
			console.log($(this).attr("id"));
			var target = $(e.target);
			console.log(target);
			if(target.attr("id")=="rune")
				addRune(target);
			if(target.attr("class")=="runeBox")
				removeRune(target);
		});
	});	
	
 	function addRune(target){
 		target=target.clone();
		var isSettable=false;
		var abilist = runeAbil[target.attr("value")][0];
		runeKind[abilist[0]]+=abilist[1];		
		var runeAbility="";
		var keys = Object.keys(runeKind);
//		console.log(keys);
		console.log(runeKind[keys[0]]);
		keys.forEach(function(key){
			if(runeKind[key]!=0){
				runeAbility += key+":"+runeKind[key]+" / ";
			}			
		});
		$("#runeAbility").html(runeAbility);
		switch(target.attr("type")){
		case "red":
			for(i = 0; i<9; i++){
				if($("#runeNum"+i).attr("data")=="empty"){
					$("#runeNum"+i).attr("data", "full");
					$("#runeNum"+i).append(target);
					isSettable=true;
					break;
				}				
			}
			isSettable==false?alert("해당 룬을 더 이상 설정 할 수 없습니다."):0;
			break;
		case "yellow":
			for(i = 10; i<19; i++){
				if($("#runeNum"+i).attr("data")=="empty"){
					$("#runeNum"+i).attr("data", "full");
					$("#runeNum"+i).append(target);					
					isSettable=true;
					break;
				}
				
			}
			isSettable==false?alert("해당 룬을 더 이상 설정 할 수 없습니다."):0;
			break;
		case "blue":
			for(i = 20; i<29; i++){
				if($("#runeNum"+i).attr("data")=="empty"){
					$("#runeNum"+i).attr("data", "full");
					$("#runeNum"+i).append(target);					
					isSettable=true;
					break;
				}
			}
			isSettable==false?alert("해당 룬을 더 이상 설정 할 수 없습니다."):0;
			break;
		case "black":
			for(i = 9; i<30; i+=10){
				if($("#runeNum"+i).attr("data")=="empty"){
					$("#runeNum"+i).attr("data", "full");
					$("#runeNum"+i).append(target);					
					isSettable=true;
					break;
				}
				
			}
			isSettable==false?alert("해당 룬을 더 이상 설정 할 수 없습니다."):0;
			break;
		default:
			break;
		}		
 	}
	
	function removeRune(target){
		alert("remove"+target);	
	}
	
	if(${runeList==null }){
		readRuneData();
		readRuneJSON();
		readRuneKind();
		readRuneAbil();
	}	
	$("#runeKind").change(function(){
		searchType($(this).val());	
	});	
	
	function searchType(sel){		
		switch(sel){
		case "표식":
			var list;
			appendRuneData("red");
			break;
		case "인장":
			var list;
			appendRuneData("yellow");
			break;
		case "문양":
			appendRuneData("blue");
			break;
		case "정수":
			appendRuneData("black");
			break;
		}
	}
	function appendRuneData(type){
		$("#runeSelector").empty();
		runeList.forEach(function(elt) {

			if(elt.type==type){
				var runeBox = "<div id='rune' type='"+elt.type+"' value='"+elt.id
					+"' title='"+elt.description+"' style='height: 40px; width: 40px;"
					 +"background-image: url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"+elt.image+"\");"
					 +"background-size: cover; '></div>";				
				$('#runeSelector').append(runeBox);
				$('#runeSelector').append("<div>"+elt.name+"</div>");
// 				var stats = runeJSON[elt.id].stats; 
// 				console.log(stats);
// 				for(key in stats){
// 					runeKind[key]+=stats[key];	
// 				}
			}
		});		
	}	
	
	function readRuneData(){
		$.get("/gameData/runeTier3", function(e){
			runeList=e;
			
		});
	}
	function readRuneAbil(){
		$.get("/gameData/runeAbil", function(e){
			runeAbil=e;			
		});
	}
	function readRuneJSON(){
		$.get("/JSON/rune", function(e){			
			runeJSON=e;			
		});		
	}
	function readRuneKind(){
		$.get("/gameData/runeKind", function(e){			
			runeKind=e;
		});		
	}
	
	
</script>


