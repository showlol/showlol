<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#runeNum0 {
	top: 230px;
	left: 19px;
}
#runeNum1 {
	top: 230px;
	left: 75px;
}

#runeNum2 {
	top: 230px;
	left: 130px;
}

#runeNum3 {
	top: 187px;
	left: 25px;
}

#runeNum4 {
	top: 187px;
	left: 5px;
}

#runeNum5 {
	top: 195px;
	left: 53px;
}

#runeNum6 {
	top: 142px;
	left: 5px;
}

#runeNum7 {
	top: 142px;
	left: 65px;
}

#runeNum8 {
	top: 118px;
	left: 35px;
}

#runeNum9 {
	top: 57px;
	left: 75px;
}

#runeNum10 {
	top: 100px;
	left: 45px;
}

#runeNum11 {
	top: 100px;
	left: 95px;
}

#runeNum12 {
	top: 50px;
	left: 68px;
}

#runeNum13 {
	top: 60px;
	left: 110px;
}

#runeNum14 {
	top: 25px;
	left: 143px;
}

#runeNum15 {
	top: 3px;
	left: 188px;
}

#runeNum16 {
	top: 10px;
	left: 210px;
}

#runeNum17 {
	top: 1px;
	left: 234px;
}

#runeNum18 {
	top: 20px;
	left: 280px;
}

#runeNum19 {
	top: 115px;
	left: 120px;
}

#runeNum20 {
	top: -8px;
	left: 350px;
}

#runeNum21 {
	top: -8px;
	left: 407px;
}

#runeNum22 {
	top: -8px;
	left: 474px;
}

#runeNum23 {
	top: 45px;
	left: 511px;
}

#runeNum24 {
	top: 5px;
	left: 549px;
}

#runeNum25 {
	top: 38px;
	left: 597px;
}

#runeNum26 {
	top: 80px;
	left: 557px;
}

#runeNum27 {
	top: 131px;
	left: 579px;
}

#runeNum28 {
	top: 24px;
	left: 34px;
}

#runeNum29 {
	top: 207px;
	left: 188px;
}

</style>
<div id="runeSetter"
		style="white-space: nowrap; height: 330px; max-width: 600px; overflow: auto;
		position: relative;
		background-image: url('https://s3-us-west-1.amazonaws.com/riot-api/img/rune-slot-ids.png');
		background-size: 580px 280px ;
		background-repeat: no-repeat;">
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
			
			var runeBox = "<div id='rune' type='"+type+"' value='"+id
			+"' title='"+list[id].description+"' style='height: 44px; width: 44px;"
			 +"background-image: url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"+img+"\");"
			 +"background-size: cover; '></div>";
			$("#runeNum"+i).append(runeBox);
			
			var abilist = runeAbil[data[i]][0];
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
