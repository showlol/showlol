<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2>최근게임</h2>
<form action="/summoner/matches" method="post">
	<input type="radio" name="type" />일반
	<input type="radio" name="type" />랭크
	<input type="text" name="sname" />
	<input type="submit" />
</form>

<c:if test="${list != null }">
	<c:forEach var="g" items="${list }">
		<table>
			<tr>	
				<td width="100px">
					<table>
						<tr>
							<td>
								<c:choose>
									<c:when test="${g.gameType == 'CUSTOM_GAME' }">
									커스텀
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${g.subType == 'NORMAL' }">
											일반
											</c:when>
											<c:otherwise>
											랭크
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td>
							<c:choose>
								<c:when test="${g.win }">
									승리
								</c:when>
								<c:otherwise>
									 패배
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</table>
				</td>
				<td width="50px">
					<table>
						<tr>
							<td>
								<img width="50" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${g.champName }.png">
							</td>
							<td>
								<table>
									<tr>
										<td>
											<img width="25" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${g.spell1 }.png">
										</td>
									</tr>
									<tr>
										<td>
											<img width="25" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/${g.spell2 }.png">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="100px">
					<table>
						<tr><td>${g.kill } / <font color="red">${g.death }</font> / ${g.assist }</td></tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${g.kda == -1 }">
										Perfect
									</c:when>
									<c:otherwise>
										${g.kda }
									</c:otherwise>
								</c:choose>
								 평점
							</td>
						</tr>
						<tr>
							<td>
								<c:choose>
									<c:when test="${g.largestMultiKill == 5 }">
										펜타킬
									</c:when>
									<c:when test="${g.largestMultiKill == 4 }">
										쿼드라킬
									</c:when>
									<c:when test="${g.largestMultiKill == 3 }">
										트리플킬
									</c:when>
									<c:when test="${g.largestMultiKill == 2 }">
										더블킬
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</td>
				<td width="80px">
					<table>
						<tr><td>레벨${g.gamelv }</td></tr>
						<tr><td>${g.cs } cs</td></tr>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[0] }.png"></td>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[1] }.png"></td>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[2] }.png"></td>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[6] }.png"></td>
						</tr>
						<tr>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[3] }.png"></td>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[4] }.png"></td>
							<td><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[5] }.png"></td>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td width="90px">
								<table>
									<c:forEach var="p" items="${g.players }">
										<c:if test="${p.teamId == 100}">
											<tr>
												<td style="line-height:5px">
													<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${p.cName }.png">
													<font size="1">
													<c:set var="len" value="${fn:length(p.sName) }"/>
													<c:choose>
														<c:when test="${len > 6 }">
															${fn:substring(p.sName,0,5) }…
														</c:when>
														<c:otherwise>
															${fn:substring(p.sName,0,6) }
														</c:otherwise>
													</c:choose>
													</font>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:if test="${g.teamId == 100 }">
										<tr>
											<td style="line-height:5px">
												<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${g.champName }.png">
												<font size="1">
													<c:set var="len" value="${fn:length(g.summonerName) }"/>
													<c:choose>
														<c:when test="${len > 6 }">
															${fn:substring(g.summonerName,0,5) }…
														</c:when>
														<c:otherwise>
															${fn:substring(g.summonerName,0,6) }
														</c:otherwise>
													</c:choose>
												</font>
											</td>
										</tr>
									</c:if>
								</table>
							</td>
							<td width="90px">
								<table>
									<c:forEach var="p" items="${g.players }">
										<c:if test="${p.teamId == 200}">
											<tr>
												<td style="line-height:5px">
													<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${p.cName }.png">
													<font size="1">
													<c:set var="len" value="${fn:length(p.sName) }"/>
													<c:choose>
														<c:when test="${len > 6 }">
															${fn:substring(p.sName,0,5) }…
														</c:when>
														<c:otherwise>
															${fn:substring(p.sName,0,6) }
														</c:otherwise>
													</c:choose>
													</font>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:if test="${g.teamId == 200 }">
										<tr>
											<td style="line-height:5px">
												<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${g.champName }.png">
												<font size="1">
													<c:set var="len" value="${fn:length(g.summonerName) }"/>
													<c:choose>
														<c:when test="${len > 6 }">
															${fn:substring(g.summonerName,0,5) }…
														</c:when>
														<c:otherwise>
															${fn:substring(g.summonerName,0,6) }
														</c:otherwise>
													</c:choose>
												</font>
											</td>
										</tr>
									</c:if>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
