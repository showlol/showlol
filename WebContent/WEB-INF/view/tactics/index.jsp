<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

소리 지르는 니가?
CHAMPION

<c:forEach var="row" items="${list }">
	<div class="content">
		<a href="/tactics/read/${row.num }" >
			${row.num }/${row.title }/${row.writer }/${row.writeDate }
		</a>
		<input type="button" id="reply">
	</div>	
</c:forEach>

<script>

</script>
