<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="i" items="${list }">
	<c:forEach var="abil" items="${i.ability }">
		${abil }
	</c:forEach>
	<br/>
</c:forEach>
