<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>챔피언 리스트</h2>
<c:forEach var="i" items="${list }">
	${i.name }<br/>
</c:forEach>