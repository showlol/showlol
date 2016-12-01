<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel='stylesheet' href='/css/tactics/runeSetting.css' >
</head>
<style>


</style>
<div id="runeSetter" >
		<c:forEach var="i" begin="0" end="29">
			<div id="runeNum${i }" class="runeBox" data="empty" style='position:absolute; '></div>
			<c:if test="${i%10==9 }">
				<br />
			</c:if>
		</c:forEach>
</div>
<div id="runeAbility"></div>
<div></div>
<div id="runeContent" class="tacticsContent" >${tactics.runeContent }</div>

<script>

var runeList = [];
var runeKind = {};
var runeAbil = {};

	$.get("/gameData/runeTier3", function(e){
		runeList=e;
		
	});

	$.get("/gameData/runeAbil", function(e){
		runeAbil=e;			
	});		


	$.get("/gameData/runeKind", function(e){			
		runeKind=e;
	});		



$("readRune.jsp").ready(function(){
	var data = "${tactics.runeData }".split("#");	
	
	$.get("/JSON/rune", function(list){		
		for(i=0; i<data.length-1; i++){
			var id = data[i];
			if(id=="undefined"){
				continue;
			}
			var img = list[id].image.full;
			var type = list[id].rune.type;
			var h=44; var w=44;
			if(i==9 || i==19 || i==29){
				h=70; w=70;
			}
			var runeBox = "<div id='rune' type='"+type+"' value='"+id
			+"' title='"+list[id].description+"' style='height: "+w+"px; width: "+h+"px;"
			 +"background-image: url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"+img+"\");"
			 +"background-size: cover; '></div>";
			$("#runeNum"+i).append(runeBox);
			var runeId = runeAbil[id];
			console.log(runeId);
			var abilist = runeId[0];
			runeKind[abilist[0]]+=abilist[1];		
		}
		console.log(runeKind);
		var runeAbility="";
		var keys = Object.keys(runeKind);
		console.log(runeKind[keys[0]]);
		keys.forEach(function(key){
			if(runeKind[key]!=0){
				runeAbility += key+":"+runeKind[key]+" / ";
			}			
		});
		$("#runeAbility").html(runeAbility);
		
	});
		
});
	
</script>
