<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="map" items="${champList }" >
	${map.id}/${map.name}
</c:forEach>
<hr/>
 
<c:forEach var="map" items="${masteryList }" >
	${map }
</c:forEach>
<hr/>

<script>
	var e = ${runeList["+0+"]}
	console.log(e);
	
</script>