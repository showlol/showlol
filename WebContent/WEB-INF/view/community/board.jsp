<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>커뮤니티 게시판 글쓰기</h3>

<form action="/community/write">
	  	작성자: <input type="text" name="writer" id="writer" ><br/>
		제목 : 	 <input type="text" name="title" id="title" size="50" ><br/>
		<br/>
		<textarea cols="100" rows="30" name="memo"></textarea>
		<br/>
		<input type="submit" value="글쓰기"/>
</form>
