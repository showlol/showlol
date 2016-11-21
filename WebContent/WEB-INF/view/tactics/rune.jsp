<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div style="float:left;">
		<select id="runeKind">
			<option>룬선택</option>
			<option>표식</option>
			<option>인장</option>
			<option>문양</option>
			<option>정수</option>	
		</select>
		<div id="runeSelector" style="height:250px; overflow-y: auto;"></div>
		
	</div>
	<div id="runeSetter" style="height: 300px; background-color: #eae179;">
		<c:forEach var = "i" begin="0" end="29">		
			<div id="runeNum${i }" class="runeBox" data="empty" ></div>
			<c:if test="${i%10==9 }" ><br/></c:if>
		</c:forEach>				
	</div>
<script>
	
	var runeList = [];
	var runeData = {
			
	}	
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
		var isSettable=false;
		switch(target.attr("type")){
		case "red":
			for(i = 0; i<9; i++){
				if($("#runeNum"+i).attr("data")=="empty"){
					$("#runeNum"+i).attr("data", "full");
					$("#runeNum"+i).css("background-image", 'url('+target.children("img").attr("src")+')');
					$("#runeNum"+i).css("background-size", "cover");
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
					$("#runeNum"+i).css("background-image", 'url('+target.children("img").attr("src")+')');
					$("#runeNum"+i).css("background-size", "cover");
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
					$("#runeNum"+i).css("background-image", 'url('+target.children("img").attr("src")+')');
					$("#runeNum"+i).css("background-size", "cover");
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
					$("#runeNum"+i).css("background-image", 'url('+target.children("img").attr("src")+')');
					$("#runeNum"+i).css("background-size", "cover");
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
	
	if(${runeList==null}){
		readRuneData();
	}	
	$("#runeKind").change(function(){
		runeKind($(this).val());	
	});	
	
	function runeKind(sel){		
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
		$("#runeSelector").html("");
		runeList.forEach(function(elt) {
			if(elt.type==type)
				$("#runeSelector").append(						
					"<span id='rune' type='"+elt.type+"' data='"+elt.id+"' title='"+elt.description
					+"'><img src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"
					+elt.image+"' style='height: 30; width: 30;' >"
					+elt.name+"</span><br/>"
				);
		});
	}
	
	function readRuneData(){
		$.get("/data/runeTier3", function(e){
			runeList=e;
		});
	}
	function test(){
		alert("aa");
	//	console.log(runeList);
	}
	
</script>
	

