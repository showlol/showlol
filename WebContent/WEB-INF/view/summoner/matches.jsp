<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>최근게임</h2>
<form action="/summoner/matches" method="post">
	<input type="radio" name="type" />일반
	<input type="radio" name="type" />랭크
	<input type="text" name="sname" />
	<input type="submit" />
</form>
String gameMode;
	String gameType;
	String subType;
	long createDate;
	int kill;
	int death;
	int assist;
	int gamelv;
	int cs;
	String champName;
	int[] items;
	List<HashMap> ally;
	List<HashMap> enemy;
	LinkedHashMap users;
	String spell1;
	String spell2;
	int teamId;
	
<c:if test="${list != null }">
	<c:forEach var="g" items="${list }">
		<table>
			<tr>	
				<td>
					<table>
						<tr>
							<td>${g.gameType }</td>
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
				<td>
				<td>
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
				<td>
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
				<td>
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
							<td colspan="2"><img width="30" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/${g.items[6] }.png"></td>
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
							<td>
								<table>
									<c:forEach var="i" items="${g.ally }">
										<tr><td>${i }</td></tr>
									</c:forEach>
								</table>
							</td>
							<td>
								<table>
									<c:forEach var="i" items="${g.enemy }">
										<tr><td>${i }</td></tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</c:forEach>
</c:if>
