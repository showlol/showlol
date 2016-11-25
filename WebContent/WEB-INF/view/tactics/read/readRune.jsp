<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="runeSetter"
		style="white-space: nowrap; height: 300px; max-width: 550px; overflow: auto; background-color: #eae179;">
		<c:forEach var="i" begin="0" end="29">
			<div id="runeNum${i }" class="runeBox" data="empty"></div>
			<c:if test="${i%10==9 }">
				<br />
			</c:if>
		</c:forEach>
</div>
<div id="runeAbility"></div>
<div></div>
<p>${tactics.runeContent }</p>

<script>

$("readRune.jsp").ready(function(){
	var data = "${tactics.runeData }".split("#");
	console.log(data);
	$.get("/JSON/rune", function(list){		
		for(i=0; i<data.length-1; i++){
			var id = data[i];
			var img = list[id].image.full;
			$("#runeNum"+i).css(
					"background-image",
					'url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/'+img+'\")'
			);
		}
	});
		
})
	
</script>
