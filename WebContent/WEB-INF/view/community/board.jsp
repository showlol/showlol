<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>커뮤니티 게시판 글쓰기</h3>
<br/>
<b>로그인 후 이용하세요.</b>
<br/>

<c:if test="${nick!=null}">
<script src="/ckeditor/ckeditor.js"></script>
	<form action="/community/write">
	  	<input type="hidden" value="${nick }" name="writer">${nick }<br/>
		제목 : 	 <input type="text" name="title" id="title" size="50" ><br/>
		<br/>
		<textarea cols="100" rows="30" name="memo" id='memo'></textarea>
		<script>CKEDITOR.replace('memo');</script>
		<br/>
		<input type="submit" value="글쓰기"/>
	</form>
</c:if>