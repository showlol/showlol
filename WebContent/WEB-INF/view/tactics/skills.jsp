<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="champInfo" style="height: 300px; overflow-y:auto; ">
	<c:forEach var="i" begin="0" end="4" step="1">
		<b id='champSkill${i }'></b><br/>
		<div id='skillImage${i }' style='float: left;'></div>
		<div id='sdWrap' style='float: left; width: 500px;'>
			<span id='skillDescript${i }' ></span>
		</div>
		<br class='clearfix'/>
	</c:forEach>	
</div>
<div>
	<div id="skillTree" style="height: 150px; "></div>
	
	<div id='initSkillWrap' class='clearBtnWrap'></div>
	<textarea name="skillContent" id="skillContent" style="resize: none;">${tactics.skillContent }</textarea>
	<script>
 		CKEDITOR.replace('skillContent');
	</script> 
</div>

<script>
//	var spells=[];	
	$("[href='#skill']").click(function(){
		try{			
			console.log(spells);	
			
		}catch(err){
			console.log("spells에러");
			loadSkill();
		}finally{
			console.log("skill script try-catch실행");
		}		
	});
	
	function loadSkill(){
		$.get("/champData/${champData.key}", function(r){			
			spells = r.spells;
			for(i=0; i<4; i++){
				var spell = 
					"<img id='setSkill' class='img-rounded' info='"
					+i+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
					+spells[i].id+".png' width='60' height='60' >"
				var description = spells[i].description;
				$("#champSkill"+i).append(spells[i].name);
				$("#skillImage"+i).append(spell);
				$("#skillDescript"+i).append(description+"<br/>");
			}				
		});
	}
	
	
	$("skills.jsp").ready(function(){
		$("#skill").click(function(e){		
			
			if(e.target.getAttribute("id")=="setSkill")
				appendSkill($(e.target).clone())==false? 
						alert("현재 레벨에서 더 이상 올릴 수 없습니다.") : 0;
		});
		
		var btnWidth = 100;
		$("#initSkillWrap").append("<input type='button' id='initSkillBtn'"
				+" class='btn-sm btn-danger' value='초기화' style='width:"
				+btnWidth+"; margin-left: "+(-btnWidth/2)+";' >");
		$("#initSkillBtn").click(function(){
			$("#skillTree").empty();			
		});
		
	});
	if(!skillTree.hasOwnProperty("level")){
		skillTree={
				level : 0,
				0 : 0,
				1 : 0,
				2 : 0,
				3 : 0,
		};
		console.log("스킬트리 객체 생성");
	}	
	console.log(skillTree);
	
	var skillBuild=""; // save
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
		skillBuild += n+"#";
		if(skillTree["level"]>1){
			var arrow = "<img src='/image/collection/arrow4.jpg' width='40' height='40' >";
			$("#skillTree").append(arrow);
		}		
		$("#skillTree").append(skill);
		if(skillTree["level"]%6==0)
			$("#skillTree").append("<br/>");
	}
</script>