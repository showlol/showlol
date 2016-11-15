<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
챔프목록<br/>
<c:if test="${champList!=null }">
	<c:forEach var="list" items="${champList}">
		${list.NAME }
		<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }" height="30" width="30"/>
	</c:forEach>
</c:if>
글읽기
<div>${tactics.title }</div><br/>
<div>${tactics.writer }</div><br/>
<div>${tactics.content1 }</div><br/>
<hr/>
<c:if test="${nick!=null }">
	<form action="/tactics/reply">
	${nick }<br/>
	<textarea rows="4"></textarea><br/>
	<input type="submit" value="입력 완료"/>
	</form>
</c:if>