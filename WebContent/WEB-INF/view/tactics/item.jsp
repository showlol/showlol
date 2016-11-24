<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="" ></a>

<c:forEach var="i" items="${list }">
	<img src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${i.id }.png' > 
</c:forEach>


