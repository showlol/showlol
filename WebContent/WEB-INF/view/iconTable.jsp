<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="map" items="${champList }" >
	${map.id}/${map.name}
</c:forEach>
<hr/>
 
<c:forEach var="map" items="${masteryList }" >
	<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/mastery/${map.id }.png" >
	${map.name }<br/>
	${map.description }<br/>
</c:forEach>
<hr/>



<script>

	
</script>