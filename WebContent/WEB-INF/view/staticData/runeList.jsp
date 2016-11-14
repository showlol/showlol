<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>룬 정보</h2>
<c:forEach var="i" items="${list }">
	<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${i.id }.png"> <b>${i.name }</b><br/>${i.description }<hr/>
</c:forEach>