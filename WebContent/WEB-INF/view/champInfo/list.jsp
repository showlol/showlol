<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="c" items="${champList }">
	<a href="/champInfo/info/${c.ID }">
		<img src="http://ddragon.leagueoflegends.com/cdn/6.23.1/img/champion/${c.IMAGE1 }" width="30">
	</a><br/>
</c:forEach>
