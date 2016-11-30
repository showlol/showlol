<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<c:if test="${list != null }">
	<c:forEach var="g" items="${list }">
		<c:choose>
			<c:when test="${g.win }">
				<c:set var="bgcolor" value="#A3CFEC"/>
			</c:when>
			<c:otherwise>
				<c:set var="bgcolor" value="#E2B6B3"/>
			</c:otherwise>
		</c:choose>
		<table>
			<tr bgcolor="${bgcolor }">	
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
							<td><a href="#" style="text-decoration:none;color:black;background-color: ${bgcolor}" title="<fmt:formatDate value="${g.createDate }" pattern="yyyy-MM-dd KK:mm:ss"/>" >
								<c:choose>
									<c:when test="${g.dTime >= 24 }">
									<fmt:parseNumber integerOnly="true" value="${g.dTime/24 }"/>일 전
									</c:when>
									<c:otherwise>
									${g.dTime }시간 전
									</c:otherwise>
								</c:choose>
							</a></td>
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
						<tr bgcolor="${bgcolor }">
							<td>
								<c:choose>
									<c:when test="${g.kda == -1 }">
										Perfect
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${g.kda }" pattern="0.00"/>:1  
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
													<a href="/summoner/index?userName=${p.sName }" style="text-decoration:none;color:black;">
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
													</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:if test="${g.teamId == 100 }">
										<tr>
											<td style="line-height:5px">
												<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${g.champName }.png">
												<a href="/summoner/index?userName=${p.summonerName }" style="text-decoration:none;color:black;">
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
												</a>
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
													<a href="/summoner/index?userName=${p.sName }" style="text-decoration:none;color:black;">
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
													</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<c:if test="${g.teamId == 200 }">
										<tr>
											<td style="line-height:5px">
												<img width="15" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${g.champName }.png">
												<a href="/summoner/index?userName=${p.summonerName }" style="text-decoration:none;color:black;">
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
												</a>
											</td>
										</tr>
									</c:if>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<c:if test="${fn:startsWith(g.subType, 'RANKED_')}">				
						<tr><td><input type="button" value="상세" onclick="openDetail(${g.gameId }, ${g.teamId })"/></td></tr>
						</c:if>
					</table>
				</td>
			</tr>
		</table>
		<table id="table_${g.gameId }" style="display:none;">
			<tr>
				<td>${g.gameId }</td>
			<tr>
		</table>
	</c:forEach>
</c:if>

<script>
	function openDetail(gid, tid) {
		if(document.getElementById("table_"+gid).style.display == "none") {
			$.ajax(
				{
				"method" : "get",
				"url" : "/summoner/matchDetail?gid="+gid+"&tid="+tid,
				"async" : false
				}
			).done(function(obj) {
				document.getElementById("table_"+gid).style.display = "block";
				$("#table_"+gid).html(obj);
			}).fail(function() {
				alert("ERROR");
			});
		}else {
			document.getElementById("table_"+gid).style.display = "none";
		}
	}
	
</script>
