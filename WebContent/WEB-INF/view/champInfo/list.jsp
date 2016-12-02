<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="champContainer">
	<c:forEach var="list" items="${champList}">
		<c:choose>
			<c:when test="${list.VIDEO == null }">
				<a href="/champInfo/info/${list.ID }">
			</c:when>
			<c:otherwise>
				<a href="/champInfo/info/${list.ID }/${list.VIDEO }">
			</c:otherwise>
		</c:choose>
		
			<div id="champPortrait">			
				<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }"
					 width="50"/><br/>
				<span style='overflow-y: hidden;'>${list.NAME }</span>
			</div>
		</a>			
	</c:forEach>
</div>	