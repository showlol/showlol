<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2>챔피언</h2>

<style>
table {
    border-collapse: collapse;
}

th {
    text-align: center;
    padding: 3px;
}

td {
    font-size: small;
    font-family: sans-serif;
    padding: 1px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}

</style>
<table>
	<tr>
		<th width="50"></th>
		<th width="120">챔피언</th>
		<th width="120">게임</th>
		<th width="150">평점</th>
		<th width="65">골드</th>
		<th width="65">CS</th>
		<th width="65">파괴한 포탑</th>
		<th width="70">최대 킬</th>
		<th width="75">최대 데스</th>
		<th width="80">평균 가한 피해량</th>
		<th width="80">평균 받은 피해량</th>
		<th width="65">더블킬</th>
		<th width="60">트리플킬</th>
		<th width="60">쿼드라킬</th>
	</tr>
	<c:set var="n" value="1"/>
	<c:forEach var="c" items="${list }">
		<tr>
			<td align="center">${n }</td>
			<td align="left"><img width="35" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${c.iname }.png"/> <b>${c.cname }</b></td>
			<td align="left">
				<table>
					<tr>
						<td>
							<c:set var="w" value="${(c.stats.totalSessionsWon / c.stats.totalSessionsPlayed) * 100}"/>
							<div class="test" style="position:relative;width:100px; height:30px;">
								<div style="position:absolute;width:${w};height:100%;background-color:#0099FF;" >
									<c:if test="${c.stats.totalSessionsWon != 0 }">
				    				<div style="text-align:left;line-height:30px;color:white;padding-left:2px">${c.stats.totalSessionsWon }승</div>
				    				</c:if>
				  				</div>
			  					<div style="position:absolute;left:${w };width:${100-w};height:100%;background-color:#FF3333" >
				  					<c:if test="${c.stats.totalSessionsLost != 0 }">
				    				<div style="text-align:right;line-height:30px;color:white;padding-right:2px">${c.stats.totalSessionsLost }패</div>
				    				</c:if>
			  					</div>
							</div>
						</td>
						<td>
							<c:choose>
								<c:when test="${w >= 50}">
									<c:set var="color1" value="red"/>
								</c:when>
								<c:otherwise>
									<c:set var="color1" value="gray"/>
								</c:otherwise>
							</c:choose>
							<font color="${color1 }"><fmt:formatNumber pattern="0">${w }</fmt:formatNumber>%</font>
						</td>
					<tr>
				</table>
			</td>
			<td align="center">
				<table>
					<tr>
						<td align="center"><b>
							<fmt:formatNumber pattern="0.0">${c.stats.totalChampionKills / c.stats.totalSessionsPlayed}</fmt:formatNumber>  / 
							<fmt:formatNumber pattern="0.0">${c.stats.totalDeathsPerSession / c.stats.totalSessionsPlayed}</fmt:formatNumber> / 
							<fmt:formatNumber pattern="0.0">${c.stats.totalAssists / c.stats.totalSessionsPlayed}</fmt:formatNumber> 
						</b></td>
					<tr>
					<tr>
						<td align="center">
							<c:set var="kda" value="${(c.stats.totalChampionKills + c.stats.totalAssists) / c.stats.totalDeathsPerSession }"/>
							<c:choose>
								<c:when test="${kda >= 5}">
									<c:set var="color" value="red"/>
								</c:when>
								<c:when test="${kda >= 4}">
									<c:set var="color" value="blue"/>
								</c:when>
								<c:when test="${kda >= 3}">
									<c:set var="color" value="green"/>
								</c:when>
								<c:otherwise>
									<c:set var="color" value="gray"/>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${c.stats.totalDeathsPerSession == 0 }">
									<font color="red">Perfect</font>
								</c:when>
								<c:otherwise>
									<font color="${color }"><fmt:formatNumber pattern="0.00">${kda }</fmt:formatNumber>:1</font>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</td>
			<td align="center"><fmt:formatNumber pattern="#,###">${c.stats.totalGoldEarned / c.stats.totalSessionsPlayed}</fmt:formatNumber></td>
			<td align="center"><fmt:formatNumber pattern="0.0">${(c.stats.totalMinionKills + c.stats.totalNeutralMinionsKilled) / c.stats.totalSessionsPlayed }</fmt:formatNumber></td>
			<td align="center"><fmt:formatNumber pattern="0.00">${c.stats.totalTurretsKilled / c.stats.totalSessionsPlayed}</fmt:formatNumber></td>
			<td align="center">${c.stats.maxChampionsKilled}</td>
			<td align="center">${c.stats.maxNumDeaths}</td>
			<td align="center"><fmt:formatNumber pattern="#,###">${c.stats.totalDamageDealt / c.stats.totalSessionsPlayed}</fmt:formatNumber></td>
			<td align="center"><fmt:formatNumber pattern="#,###">${c.stats.totalDamageTaken / c.stats.totalSessionsPlayed}</fmt:formatNumber></td>
			<td align="center">${c.stats.totalDoubleKills }</td>
			<td align="center">${c.stats.totalTripleKills }</td>
			<td align="center">${c.stats.totalQuadraKills }</td>
		</tr>
		<c:set var="n" value="${n+1 }"/>
	</c:forEach>
</table>