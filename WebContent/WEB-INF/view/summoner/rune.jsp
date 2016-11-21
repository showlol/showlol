<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<c:set var="i" value="1"/>
<c:if test="${list != null}">
   <c:forEach var="m" items="${list }">
      <span onclick="script:show(${i})">${i }.${m.name}
      </span>
      <c:set var="i" value="${i+1}"/>
   </c:forEach>
</c:if>

<c:set var="j" value="1"/>
<c:if test="${list != null}">
   <c:forEach var="m" items="${list }">
      <c:choose>
      <c:when test="${m.current == true }">
         <div id="div${j }" name="cls">
      </c:when>
      <c:otherwise>
         <div id="div${j }" name="cls" style="display:none">
      </c:otherwise>
      </c:choose>
      	<c:forEach var="s" items="${m.slots }">
      		<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${s.img }" title="${s.name}(${s.des})"/>
      	</c:forEach>
      </div>
      <c:set var="j" value="${j+1}"/>
   </c:forEach>
</c:if>

<script>
   function show(index) {
	  var tmp = document.getElementsByName("cls");
      for(var i=0; i<tmp.length; i++) {
         tmp[i].style.display = "none";
      }
      document.getElementById("div"+index).style.display = "block";
   }  
      
</script>




