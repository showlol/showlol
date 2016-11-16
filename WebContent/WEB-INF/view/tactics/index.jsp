<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

CHAMPION<br/><hr/>

<c:if test="${champList!=null }">
	<div id="champContainer">
		<c:set var="col" value="0" />
		<c:forEach var="list" items="${champList}">
			<a href="javascript:champTactics('${list.NAME }')">
				<div id="champPortrait">			
				<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }"
					 height="50" width="50"/><br/>
				${list.NAME }
				</div>
			</a>			
		</c:forEach>
	</div>	
</c:if>
<hr/>
<c:forEach var="row" items="${list }">
	<div class="content">
		<a href="/tactics/read/${row.num }" >
			${row.num }/${row.title }/${row.writer }/${row.writeDate }
		</a>
		<input type="button" id="reply">
	</div>	
</c:forEach>

<script>
	
	function champTactics(name){
		$.get("");
	}
</script>



