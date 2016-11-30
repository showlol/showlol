<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<h3 style="font-family: 'Nanum Gothic', sans-serif;">쪽지 보내기</h3>

<form action="/memo/write">
	<table class="table table-bordered">
		<tr>
			<th style="font-family: 'Nanum Gothic', sans-serif;">닉네임</th>
			<td><input type="text" name="to" id="to" size="50" value="${to }" required></td>
		</tr>
		<tr>
			<th style="font-family: 'Nanum Gothic', sans-serif;">제목</th>
			<td><input type="text" name="title" id="title" size="50" required></td>
		</tr>
		<tr style="width: 500px;">
			<th style="font-family: 'Nanum Gothic', sans-serif;">내용</th>
			<td><textarea cols="50" rows="10" name="memo" id='memo' style="resize:none;" required></textarea></td>
		</tr>
	</table>
	<div align="right"><input class="btn btn-success" type="submit" value="글쓰기"/></div>
</form>