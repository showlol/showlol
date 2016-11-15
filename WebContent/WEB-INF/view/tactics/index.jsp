<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

소리 지르는 니가?
CHAMPION

<c:if test="${champList!=null }">
	<c:forEach var="list" items="${champList}">
		${list.NAME }
		<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }" height="30" width="30"/>
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
