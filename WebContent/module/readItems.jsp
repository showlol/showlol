<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="itemTree" style='clear: left;'></div>
<div id="itemContent" class="tacticsContent" >로딩중...</div>

<script>	
	var detailItems={};
	var tactics={};
	var xhr1 = new XMLHttpRequest();
	xhr1.open("get", "/tactics/read/item/${param.num}");
	xhr1.onreadystatechange=function(){
		if(xhr1.readyState==4 && xhr1.status==200){
			tactics = JSON.parse(xhr1.responseText);
			checkData("xhr1");
		}
	}
	var xhr2 = new XMLHttpRequest();
	xhr2.open("get", "/gameData/item/detail");
	xhr2.onreadystatechange=function(){
		if(xhr2.readyState==4 && xhr2.status==200){
			detailItems = JSON.parse(xhr2.responseText);
			checkData("xhr2");
		}
	}
	xhr1.send();
	xhr2.send();
	var check1, check2;
	function checkData(r){
		if(r=="xhr1"){
			check1=r;
		}
		if(r=="xhr2"){
			check2=r;
		}
		if(check1=="xhr1" && check2=="xhr2"){			
			appendData(detailItems);
		}
	}
	function appendData(list) {		
		var itemBuild = tactics.ITEMBUILD.split("#");
		
		for(i=0; i<itemBuild.length-1; i++){
			var img = list[itemBuild[i]].image.full;
			$("#itemTree").append("<img title='+"+list[itemBuild[i]]+"' info='"+itemBuild[i]+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/"
					+img+"'>");			
		}
		console.log("아이템 로드");
		$("#itemContent").html(tactics.ITEMCONTENT);
	}	
</script>