<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="champInfo" style="height: 300px; overflow-y:auto; ">
	${param.champ } 스킬 로딩중...
</div>
<div id="skillTree" style="height: 150px; "></div>
<script>

	var spells=[];
	$.get("/champData/${param.key }", function(r){
		$("#champInfo").empty();
		spells = r.spells;
		for(i=0; i<4; i++){
			var spell = 
				"<img id='setSkill' info='"
				+i+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
				+spells[i].id+".png'><br/>"
			var description = spells[i].description;
			$("#champInfo").append(spells[i].name);
			$("#champInfo").append(spell);
			$("#champInfo").append(description+"<br/>");
		}				
	});
	
	$("skills.jsp").ready(function(){
		$("#skill").click(function(e){		
			
			if(e.target.getAttribute("id")=="setSkill")
				appendSkill($(e.target).clone())==false? 
						alert("현재 레벨에서 더 이상 올릴 수 없습니다.") : 0;
		});
	});
	
	var skillTree={
			level : 0,
			0 : 0,
			1 : 0,
			2 : 0,
			3 : 0,
	};
	function appendSkill(skill){
		var n = skill.attr("info");		
	
		if (n == 3) {
			console.log((skillTree[n] + 1) * 6 + "/"
					+ (skillTree["level"] / 1 + 1));
			if ((skillTree[n] + 1) * 6 > parseFloat(skillTree["level"]) + 1) {
				return false;
			} else if (skillTree[n] + 1 > 3) {
				return false;
			}
		}
		console.log(skillTree[n] + 1 + "/"
				+ (parseFloat(skillTree["level"]) + 2) / (2.0));
		if (skillTree[n] + 1 > 5) {
			return false;
		}
		if (skillTree[n] + 1 > (parseFloat(skillTree["level"]) + 2) / (2.0)) {
			return false;
		}
		
		skillTree["level"]++;
		skillTree[n]++;
		$("#skillTree").append(skill);
		
	}
</script>