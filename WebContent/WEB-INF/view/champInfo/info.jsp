<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>INFO</h2>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#info">챔피언 정보</a></li>
			<li><a data-toggle="tab" href="#stat">능력치</a></li>
			<li><a data-toggle="tab" href="#skill">스킬</a></li>
			<li><a data-toggle="tab" href="#story">스토리</a></li>
		</ul>
		
		<div class="tab-content">
			<div id="info" class="tab-pane fade in active">
				<c:set var="img" value="${fn:split(info.image.full, '.')}" />
				<img
					src="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${img[0] }_0.jpg"
					width="800">
			</div>
			<div id="stat" class="tab-pane fade">
				<%@include file="/WEB-INF/jspf/table.jspf" %>
				<table border="1">
					<tr>
						<th>구분</th>
						<th>1레벨(레벨당 성장수치)</th>
						<th>18레벨</th>
					</tr>
					<tr>
						<td>체력</td>
						<td>${info.stats.hp } (+${info.stats.hpperlevel })</td>
						<td>
							<c:set var="hp18" value="${info.stats.hp + (info.stats.hpperlevel * 17) }"/>
							${hp18 }
						</td>
					</tr>
					<tr>
						<td>마나</td>
						<td>${info.stats.mp } (+${info.stats.mpperlevel })</td>
						<td>
							<c:set var="mp18" value="${info.stats.mp + (info.stats.mpperlevel * 17) }"/>
							${mp18 }
						</td>
					</tr>
					<tr>
						<td>공격력</td>
						<td>${info.stats.attackdamage } (+${info.stats.attackdamageperlevel })</td>
						<td>
							<c:set var="atk18" value="${info.stats.attackdamage + (info.stats.attackdamageperlevel * 17) }"/>
							${atk18 }
						</td>
					</tr>
					<tr>
						<td>공격 속도</td>
						<td>${info.stats.attackspeedoffset } (+${info.stats.attackspeedperlevel }%)</td>
						<td>
							<c:set var="atk18" value="${info.stats.attackspeedoffset + (info.stats.attackspeedperlevel * 17) }"/>
							${atk18 }
						</td>
					</tr>
					<tr>
						<td>5초당 체력회복</td>
						<td>${info.stats.hpregen } (+${info.stats.hpregenperlevel })</td>
						<td>
							<c:set var="hpr18" value="${info.stats.hpregen + (info.stats.hpregenperlevel * 17) }"/>
							${hpr18 }
						</td>
						</td>
					</tr>
					<tr>
						<td>5초당 마나회복</td>
						<td>${info.stats.mpregen } (+${info.stats.mpregenperlevel })</td>
						<td>
							<c:set var="mpr18" value="${info.stats.mpregen + (info.stats.mpregenperlevel * 17) }"/>
							${mpr18 }
						</td>
						</td>
					</tr>
					<tr>
						<td>방어력</td>
						<td>${info.stats.armor } (+${info.stats.armorperlevel })</td>
						<td>
							<c:set var="arm18" value="${info.stats.armor + (info.stats.armorperlevel * 17) }"/>
							${arm18 }
						</td>
						</td>
					</tr>
					<tr>
						<td>마법 저항력</td>
						<td>${info.stats.spellblock } (+${info.stats.spellblockperlevel })</td>
						<td>
							<c:set var="arm18" value="${info.stats.spellblock + (info.stats.spellblockperlevel * 17) }"/>
							${arm18 }
						</td>
						</td>
					</tr>
					<tr>
						<td>이동 속도</td>
						<td>${info.stats.movespeed }</td>
						<td>${info.stats.movespeed }</td>
						</td>
					</tr>
					<tr>
						<td>사정 거리</td>
						<td>${info.stats.attackrange }</td>
						<td>${info.stats.attackrange }</td>
						</td>
					</tr>
				</table>
			</div>
			<div id="skill" class="tab-pane fade">
				<img src="http://ddragon.leagueoflegends.com/cdn/6.23.1/img/passive/${info.passive.image.full }" onmouseover="sss()"/>
				<c:forEach var="i" begin="0" end="3">
				<img src="http://ddragon.leagueoflegends.com/cdn/6.23.1/img/spell/${info.spells[i].image.full }"/>
				</c:forEach>
			</div>
			<div id="passive" class="skillCls">
				${info.passive.description }
			</div>
			<c:forEach var="i" begin="0" end="3">
				<div id="skill${i }" class="skillCls">
					${info.skills[i].description }
				</div>
			</c:forEach>
			<div id="story" class="tab-pane fade">
				<table>
					<tr>
						<td width="800px;">${info.lore }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	
window.onload = function() {
	var len = $(".skillCls").length;
}
	
</script>