<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="/summoner/index" method="post">
	<input type="text" name="userName" value="${sname }"/>
	<input type="submit" value="검색"/>
</form>

