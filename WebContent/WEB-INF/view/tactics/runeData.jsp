<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="i" items="${list }">
	
	<c:forEach var="abil" items="${i.list }">
		<c:forEach var="ab" items="${abil }">
			${ab }/
		</c:forEach>		
	</c:forEach>
	<br/>
</c:forEach>
