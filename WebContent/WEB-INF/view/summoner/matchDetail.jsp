<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table border="1" width="500;">
	<c:choose>
		<c:when test="${isWin }">
			<c:set var="win1" value="승리"/>
			<c:set var="win2" value="패배"/>
			<c:set var="bgcolor1" value="#A3CFEC"/>
			<c:set var="bgcolor2" value="#E2B6B3"/>
			<c:set var="bgcolor3" value="#9FC9E6"/>
			<c:set var="bgcolor4" value="#DCB1AE"/>
			<c:set var="baronimg1" value="http://sk2.op.gg/images/baron_nashor_100.png"/>
			<c:set var="dragonimg1" value="http://sk2.op.gg/images/dragon_100.png"/>
			<c:set var="turretimg1" value="http://sk2.op.gg/images/turret_100.png"/>
			<c:set var="baronimg2" value="http://sk2.op.gg/images/baron_nashor_200.png"/>
			<c:set var="dragonimg2" value="http://sk2.op.gg/images/dragon_200.png"/>
			<c:set var="turretimg2" value="http://sk2.op.gg/images/turret_200.png"/>
		</c:when>
		<c:otherwise>
			<c:set var="win1" value="패배"/>
			<c:set var="win2" value="승리"/>
			<c:set var="bgcolor1" value="#E2B6B3"/>
			<c:set var="bgcolor2" value="#A3CFEC"/>
			<c:set var="bgcolor3" value="#DCB1AE"/>
			<c:set var="bgcolor4" value="#9FC9E6"/>
			<c:set var="baronimg2" value="http://sk2.op.gg/images/baron_nashor_100.png"/>
			<c:set var="dragonimg2" value="http://sk2.op.gg/images/dragon_100.png"/>
			<c:set var="turretimg2" value="http://sk2.op.gg/images/turret_100.png"/>
			<c:set var="baronimg1" value="http://sk2.op.gg/images/baron_nashor_200.png"/>
			<c:set var="dragonimg1" value="http://sk2.op.gg/images/dragon_200.png"/>
			<c:set var="turretimg1" value="http://sk2.op.gg/images/turret_200.png"/>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${map.teams[0].teamId == tid }">
			<c:set var="baronKills1" value="${map.teams[0].baronKills }"/>
			<c:set var="dragonKills1" value="${map.teams[0].dragonKills }"/>
			<c:set var="towerKills1" value="${map.teams[0].towerKills }"/>
			<c:set var="baronKills2" value="${map.teams[1].baronKills }"/>
			<c:set var="dragonKills2" value="${map.teams[1].dragonKills }"/>
			<c:set var="towerKills2" value="${map.teams[1].towerKills }"/>
		</c:when>
		<c:otherwise>
			<c:set var="baronKills1" value="${map.teams[1].baronKills }"/>
			<c:set var="dragonKills1" value="${map.teams[1].dragonKills }"/>
			<c:set var="towerKills1" value="${map.teams[1].towerKills }"/>
			<c:set var="baronKills2" value="${map.teams[0].baronKills }"/>
			<c:set var="dragonKills2" value="${map.teams[0].dragonKills }"/>
			<c:set var="towerKills2" value="${map.teams[0].towerKills }"/>
		</c:otherwise>
	</c:choose>
	<tr bgcolor="${bgcolor3 }" style="height: 30px;">
		<td colspan="2" align="center" width="140">${win1 }</td>
		<td align="center" width="170">아이템</td>
		<td align="center" width="90">평점</td>
		<td align="center" width="100">피해량</td>
		<td align="center" width="100">와드</td>
		<td align="center" width="100">CS</td>
		<td align="center" width="100">골드</td>
	<tr>
	<c:forEach var="p" items="${map.plist }">
		<c:if test="${p.teamId == tid }">
			<tr bgcolor="${bgcolor1 }">
				<td>
					<table>
						<tr>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${p.champName }.png"></td>
							<td>
								<table>
									<tr><td><img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${p.spell1 }.png"></td></tr>
									<tr><td><img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${p.spell2 }.png"></td></tr>
								</table>
							</td>
						<tr>
					</table>
				</td>
				<td align="center"><font size="2">${p.summonerName }</font></td>
				<td align="center">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item0 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item1 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item2 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item3 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item4 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item5 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item6 }.png">
				</td>
				<td align="center">
					<table>
						<tr>
							<td><font size="2">
								<c:choose>
									<c:when test="${p.kda == -1 }">
									Perfect
									</c:when>
									<c:otherwise>
									<fmt:formatNumber value="${p.kda }" pattern="0.00"/> : 1
									</c:otherwise>
								</c:choose>
							</font></td>
						</tr>
						<tr><td><font size="2">${p.kills }/${p.deaths}/${p.assists }</font></td></tr>
					</table>
				</td>
				<td align="center">
					<font size="2">${p.totalDamageDealtToChampions }</font>
				</td>
				<td align="center">
					<font size="2">${p.wardsPlaced } / ${p.wardsKilled }</font>
				</td>
				<td align="center">
					<font size="2">${p.cs}</font>
				</td>
				<td align="center">
					<font size="2">${p.goldEarned }</font>
				</td>
			<tr/>
		</c:if>
	</c:forEach>
	<tr style="height: 30px;">
		<td colspan="2" style="padding-left:10px;" bgcolor="${bgcolor1 }" align="left">
			<img src="${baronimg1 }" width="20"> ${baronKills1 }&nbsp;
			<img src="${baronimg1 }" width="20"> ${dragonKills1 }&nbsp;
			<img src="${baronimg1 }" width="20"> ${towerKills1 }
		</td>
		<td colspan="2" style="padding-right:10px;" bgcolor="${bgcolor1 }" align="right">
			<c:choose>
				<c:when test="${tid == 100 }">
					<img src="http://sk2.op.gg/images/scoreboardicon_score.png" width="20"> ${map.totalKill100 } / ${map.totalDeath100 } / ${map.totalAssist100 }
				</c:when>
				<c:otherwise>
					<img src="http://sk2.op.gg/images/scoreboardicon_score.png" width="20"> ${map.totalKill200 } / ${map.totalDeath200 } / ${map.totalAssist200 }
				</c:otherwise>
			</c:choose>
		</td>
		<td colspan="2" style="padding-left:10px;" bgcolor="${bgcolor2 }" align="left">
			<c:choose>
				<c:when test="${tid == 100 }">
					<img src="http://sk2.op.gg/images/scoreboardicon_score.png" width="20"> ${map.totalKill200 } / ${map.totalDeath200 } / ${map.totalAssist200 }
				</c:when>
				<c:otherwise>
					<img src="http://sk2.op.gg/images/scoreboardicon_score.png" width="20"> ${map.totalKill100 } / ${map.totalDeath100 } / ${map.totalAssist100 }
				</c:otherwise>
			</c:choose>
		</td>
		<td colspan="2" style="padding-right:10px;" bgcolor="${bgcolor2 }" align="right">
			<img src="${baronimg2 }" width="20"> ${baronKills2 }&nbsp;
			<img src="${baronimg2 }" width="20"> ${dragonKills2 }&nbsp;
			<img src="${baronimg2 }" width="20"> ${towerKills2 }
		</td>
	</tr>
	<tr bgcolor="${bgcolor4 }" style="height: 30px;">
		<td colspan="2" align="center" width="140">${win2 }</td>
		<td align="center" width="170">아이템</td>
		<td align="center" width="90">평점</td>
		<td align="center" width="100">피해량</td>
		<td align="center" width="100">와드</td>
		<td align="center" width="100">CS</td>
		<td align="center" width="100">골드</td>
	<tr>
	<c:forEach var="p" items="${map.plist }">
		<c:if test="${p.teamId != tid }">
			<tr bgcolor="${bgcolor2 }">
				<td>
					<table>
						<tr>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${p.champName }.png"></td>
							<td>
								<table>
									<tr><td><img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${p.spell1 }.png"></td></tr>
									<tr><td><img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${p.spell2 }.png"></td></tr>
								</table>
							</td>
						<tr>
					</table>
				</td>
				<td align="center"><font size="2">${p.summonerName }</font></td>
				<td align="center">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item0 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item1 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item2 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item3 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item4 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item5 }.png">
					<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item6 }.png">
				</td>
				<td align="center">
					<table>
						<tr>
							<td><font size="2">
								<c:choose>
									<c:when test="${p.kda == -1 }">
									Perfect
									</c:when>
									<c:otherwise>
									<fmt:formatNumber value="${p.kda }" pattern="0.00"/> : 1
									</c:otherwise>
								</c:choose>
							</font></td>
						</tr>
						<tr><td><font size="2">${p.kills }/${p.deaths}/${p.assists }</font></td></tr>
					</table>
				</td>
				<td align="center">
					<font size="2">${p.totalDamageDealtToChampions }</font>
				</td>
				<td align="center">
					<font size="2">${p.wardsPlaced } / ${p.wardsKilled }</font>
				</td>
				<td align="center">
					<font size="2">${p.cs}</font>
				</td>
				<td align="center">
					<font size="2">${p.goldEarned }</font>
				</td>
			<tr/>
		</c:if>
	</c:forEach>
</table>