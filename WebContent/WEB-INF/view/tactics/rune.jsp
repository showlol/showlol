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
<div style="height: 300px; background-color: #eae179;">

이건 안되나?<input type="button" onclick='test()' >
</div>

<script>
	
	var runeList = [];
	var runeData = {
			
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
		for(i =0; i<runeList.length; i++){
			if(runeList[i].type==type)
				$("#runeSelector").append(					
					"<img src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"
					+runeList[i].image+"' >"
					+runeList[i].name+"<br/>"
				);
		}		
	}
	
	var rune;
	function readRuneData(){
		$.get("/data/rune", function(e){
			runeList=e;
		});
	}
	function test(){
		console.log(rune);
	}
	
</script>
	

