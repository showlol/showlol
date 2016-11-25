<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="skillTree" style="height: 150px; width: auto;"></div>
<div style='clear: left;'></div>
<p>${tactics.skillContent }</p>
			
<script>
$.get("/champData/${champData.key }", function(r){
// 	$("#champInfo").empty();
	console.log(r.spells);
	var spells = r.spells;
	var skillTree = "${tactics.skillBuild }".split("#");
	for(i=0; i<skillTree.length-1; i++){
		var img = spells[skillTree[i]].image.full;
		var spell = 
			"<img id='setSkill' info='"
			+0+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
			+img+"'>"		
		$("#skillTree").append(spell);		
		var arrow = "<h1 style='display:inline;'>→</h1>";
		$("#skillTree").append(arrow);	
	}		
// 		var description = spells[i].description;
// 		$("#champInfo").append(spells[i].name);
// 		$("#champInfo").append(spell);
// 		$("#champInfo").append(description+"<br/>");
					
});


</script>			
