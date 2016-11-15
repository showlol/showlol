<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br/>
<br/>
<h2>특성</h2>
<form action="/summoner/mastery" method="post">
	<input type="text" name="name" />
	<input type="submit"/>
</form>

<c:set var="i" value="1"/>
<c:if test="${list != null}">
	<c:forEach var="m" items="${list }">
		${i }.<b>${m.name}</b>
		<div style="display:none">
			${m.masteries}
		</div>
		<c:set var="i" value="${i+1}"/>
	</c:forEach>
</c:if>

<c:set var="j" value="1"/>
<c:if test="${list != null}">
	<c:forEach var="m" items="${list }">
		<c:choose>
		<c:when test="${m.current == true }">
			<div id="div${j }">
		</c:when>
		<c:otherwise>
			<div id="div${j }" style="display:none">
		</c:otherwise>
		</c:choose>
			${m.masteries}
		</div>
		<c:set var="j" value="${j+1}"/>
	</c:forEach>
</c:if>

