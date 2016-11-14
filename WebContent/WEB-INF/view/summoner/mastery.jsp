<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>특성</h2>
<form action="/summoner/mastery" method="post">
	<input type="text" name="name" />
	<input type="submit"/>
</form>

<c:if test="${list != null}">
	<c:forEach var="i" items="${list }">
		<b>${i.name}</b>
		<c:if test="${i.current == true }">(사용중)</c:if>
		<br/>
		${i.masteries}<hr/>
	</c:forEach>
</c:if>