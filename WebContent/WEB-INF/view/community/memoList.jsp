<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<table class="table table-bordered">
	<tr>
		<th>no.</th>
		<th>제목</th>
		<th>보낸이</th>
	</tr>
	<c:forEach var="t" items="${list }">
		<tr>
			<td>${t.IDX }</td>
			<td>${t.TITLE }</td>
			<td>${t.WRITEFROM }</td>
		</tr>
	</c:forEach>
</table>