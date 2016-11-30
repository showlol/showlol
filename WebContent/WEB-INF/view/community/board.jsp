<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	b{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<h3 style="font-family: 'Nanum Gothic', sans-serif;">커뮤니티 게시판 글쓰기</h3>


<b>작성자</b><c:if test="${nick!=null}">
<script src="/ckeditor/ckeditor.js"></script>
	<form action="/community/write" method="post">
	  	<input type="hidden" value="${nick }" name="writer">${nick }<br/>
		<b>제목 : </b><input type="text" name="title" id="title" size="50" style="font-family: 'Nanum Gothic', sans-serif;"><br/>
		<br/>
		<textarea cols="100" rows="30" name="memo" id='memo'></textarea>
		<script>CKEDITOR.replace('memo');</script>
		<br/>
		<input type="submit" value="게시글등록!" class="btn-sm btn-primary" style="font-family: 'Nanum Gothic', sans-serif;" />
	</form>
</c:if>