<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="itemTree" style='clear: left; white-space: normal;'></div>
<div id="itemContent" class="tacticsContent" >${tactics.itemContent }</div>

<script>
	var detailItems={};
	$.get("/gameData/item/detail", function(list) {
		detailItems = list;
		var itemBuild = "${tactics.itemBuild}".split("#");
		for(i=0; i<itemBuild.length-1; i++){
			var img = list[itemBuild[i]].image.full;
			$("#itemTree").append("<img title='+"+list[itemBuild[i]]+"' info='"+itemBuild[i]+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/"
					+img+"'>");			
		}		
	});

	
</script>