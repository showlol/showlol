<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

글읽기
<div>${tactics.title }</div><br/>
<div>${tactics.writer }</div><br/>
<div>${tactics.content1 }</div><br/>
<hr/>
<c:if test="${nick!=null }">
	<form action="/tactics/reply">
	<input type="hidden" name="nick" value="${nick }">${nick }<br/>
	<input type="hidden" name="parentNum" value="${tactics.num }">
	<textarea rows="4" name="area"></textarea><br/>
	<input type="submit" value="입력 완료"/>
	</form>
</c:if>