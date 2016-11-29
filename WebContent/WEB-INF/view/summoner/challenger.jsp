<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cnt" value="${startIdx + 1}"/>
<c:forEach var="i" items="${list }">
	<tr height="40" style="border-style: solid; border-bottom-color: #000000; border-width:1px;" >
		<td align="center">${cnt }</td>
		<td><b>${i.playerOrTeamName }</b></td>
		<td align="center">Challenger</td>
		<td align="center">${i.leaguePoints } LP</td>
		<td align="center">
		<table>
			<tr>
				<td>
					<div style="position:relative;width:150px; height:30px;">
						<c:set var="rate" value="${(i.wins / (i.wins + i.losses)) * 150}"/>
						<div style="position:absolute;width:${rate};height:100%;background-color:#0099FF;border-top-left-radius: 5px;border-bottom-left-radius: 5px;" >
							<c:if test="${i.wins != 0 }">
		    				<div style="text-align:left;line-height:30px;color:white;padding-left:5px">${i.wins }승</div>
		    				</c:if>
		  				</div>
	  					<div style="position:absolute;left:${rate };width:${150-rate};height:100%;background-color:#FF3333;border-top-right-radius: 5px;border-bottom-right-radius: 5px;" >
		  					<c:if test="${i.losses != 0 }">
		    				<div style="text-align:right;line-height:30px;color:white;padding-right:5px">${i.losses }패</div>
		    				</c:if>
	  					</div>
					</div>
				</td>
				<td style="padding-left: 5px;"><font color="grey"><fmt:formatNumber pattern="0">${rate }</fmt:formatNumber>%</font></td>
			</tr>
		</table>
		</td>
	</tr>
	<c:set var="cnt" value="${cnt+1 }"/>
</c:forEach>