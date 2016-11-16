<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
${tid }
<table>
	<tr>
		<td>승패</td>
		<td>아이템</td>
		<td>평점</td>
		<td>피해량</td>
		<td>와드</td>
		<td>CS</td>
		<td>골드</td>
	<tr>
	<c:forEach var="p" items="${list }">
		<tr>
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
			<td>
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item0 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item1 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item2 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item3 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item4 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item5 }.png">
				<img width="20" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${p.item6 }.png">
			</td>
			<td>
				<table>
					<tr><td><font size="2"><fmt:formatNumber value="${p.kda }" pattern="0.00"/> : 1</font></td></tr>
					<tr><td><font size="2">${p.kills }/${p.deaths}/${p.assists }</font></td></tr>
				</table>
			</td>
			<td>
				<font size="2">${p.totalDamageDealtToChampions }</font>
			</td>
			<td>
				<font size="2">${p.wardsPlaced } / ${p.wardsKilled }</font>
			</td>
			<td>
				<font size="2">${p.cs}</font>
			</td>
			<td>
				<font size="2">${p.goldEarned }</font>
			</td>
		<tr/>
	</c:forEach>
</table>
${map}