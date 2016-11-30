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
	left: 135px;
}

#runeNum3 {
	top: 189px;
	left: 5px;
}

#runeNum4 {
	top: 189px;
	left: 58px;
}

#runeNum5 {
	top: 195px;
	left: 107px;
}

#runeNum6 {
	top: 154px;
	left: 26px;
}

#runeNum7 {
	top: 156px;
	left: 95px;
}

#runeNum8 {
	top: 137px;
	left: 59px;
}

#runeNum9 {
	top: 20px;
	left: 55px;
}

#runeNum10 {
	top: 105px;
	left: 30px;
}

#runeNum11 {	
	top: 101px;
	left: 91px;
}

#runeNum12 {
	top: 76px;
	left: 56px;
}

#runeNum13 {
	top: 60px;
	left: 104px;
}

#runeNum14 {
	top: 30px;
	left: 132px;
}

#runeNum15 {
	top: 11px;
	left: 183px;
}

#runeNum16 {
	top: 5px;
	left: 234px;
}

#runeNum17 {
	top: -7px;
	left: 291px;
}

#runeNum18 {
	top: 20px;
	left: 315px;
}

#runeNum19 {
	top: 50px;
	left: 300px;
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
	left: 478px;	
}
/* 우측 끝 */
#runeNum23 {
	top: 17px;
	left: 525px;
}

#runeNum24 {
	top: 24px;
	left: 382px;
	
}

#runeNum25 {
	top: 42px;
	left: 418px;
}

#runeNum26 {
	top: 17px;
	left: 451px;
}

#runeNum27 {
	top: 30x;
	left: 487px;
}

#runeNum28 {
	top: 73px;
	left: 508px;
}

#runeNum29 {
	top: 100px;
	left: 300px;
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
