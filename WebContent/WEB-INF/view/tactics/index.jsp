<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

CHAMPION<br/><hr/>

<c:if test="${champList!=null }">
	<c:set var="col" value="0" />
	<c:forEach var="list" items="${champList}">
		${col=col+1 }
		<div id="champPortrait">			
			<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }"
				 height="30" width="30"/><br/>
			${list.NAME }
		</div>
		
	</c:forEach>
</c:if>
<c:forEach var="row" items="${list }">
	<div class="content">
		<a href="/tactics/read/${row.num }" >
			${row.num }/${row.title }/${row.writer }/${row.writeDate }
		</a>
		<input type="button" id="reply">
	</div>	
</c:forEach>

<script>

</script>
