<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${data} <hr/>
 <hr/>
<h6>Q스킬</h6>
<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/AatroxQ.png"><br/>
<c:forEach var="i" items="${data.Aatrox.spells[0] }">
	${i }<br/>
</c:forEach>
<h4>W스킬</h4>
<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/AatroxW.png"><br/>
<c:forEach var="i" items="${data.Aatrox.spells[1] }">
	${i }<br/>
</c:forEach>
<h4>E스킬</h4>
<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/AatroxE.png"><br/>
<c:forEach var="i" items="${data.Aatrox.spells[2] }">
	${i }<br/>
</c:forEach>
<h4>R스킬</h4>
<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/AatroxR.png"><br/>
<c:forEach var="i" items="${data.Aatrox.spells[3] }">
	${i }<br/>
</c:forEach>
<hr/>
