<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="/ckeditor/ckeditor.js"></script>
<link href="/css/tactics.css" rel="stylesheet">
<title>커뮤니티 게시글 수정하기</title>
</head>
<form action="/community/writeUpdate2" method="get">
	<input type="hidden" value="${nick }" name="writer">${nick }<br/>
		<b style="font-family: 'Nanum Gothic', sans-serif;">제목 : </b><input type="text" name="title" id="title" size="50" value="${sessionScope.wdata.title }"><br/>
		<br/>
		<textarea cols="100" rows="30" name="memo" id="memo" >${sessionScope.wdata.memo }</textarea>
		<script>CKEDITOR.replace("memo");</script>
		<br/>
		<input type='hidden' name='num' value='${num }' >
		<input type="submit" value="수정하기" class="btn-sm btn-primary" />
</form>