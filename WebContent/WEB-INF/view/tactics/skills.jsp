<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="champInfo" style="height: 300px; overflow-y:auto; ">
	${param.champ } 스킬 로딩중...
</div>
<div id="skillTree" style="height: 150px; "></div>
<script>
	$.get("/champData/${param.key }", function(r){
		$("#champInfo").empty();
		var spells = r.spells;
		for(i=0; i<4; i++){
			var spell = 
				"<img id='setSkill' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
				+spells[i].id+".png'><br/>"
			var description = spells[i].description;
			$("#champInfo").append(spell);
			$("#champInfo").append(description+"<br/>");
		}		
				
	});
	
	$("skills.jsp").ready(function(){
		$("#skill").click(function(e){
			e.target.getAttribute("id")=="setSkill" ? appendSkill(e.target.clone) : 0;
		});
	});
	
	function appendSkill(skill){
		$("#skillTree").append(skill);	
	}
	
	
</script>