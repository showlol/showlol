<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<table>
		<tr>
			<td>
				<img width="100" src="/image/tier_icons/${fn:toLowerCase(map2.tier) }_${fn:toLowerCase(map2.entries[0].division) }.png">
			</td>
			<td>
				<table>
					<tr><td><b>${map2.tier } ${map2.entries[0].division }</b></td></tr>
					<tr><td>${map2.name }</td></tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<table width="100%" align="center">
	<tr>
		<td>
			<table>
				<tr height="50">
					<th width="50"></th>
					<th width="400">소환사</th>
					<th width="200">휘장</th>
					<th width="200">승리</th>
					<th width="200">승급전/포인트</th>
				</tr>
				<c:set var="cnt" value="1"/>
				<c:forEach var="lg" items="${map.tList }">
				<c:choose>
					<c:when test="${map2.entries[0].playerOrTeamName == lg.playerOrTeamName }">
						<tr bgcolor="aqua">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
					<td align="center">${cnt }</td>
					<td><font size="3">${lg.playerOrTeamName }</font></td>
					<td align="center">
						<c:choose>
							<c:when test="${lg.veteran }">
								<img width="20" src="/image/icon/trophy1.png" title="100게임 이상"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/trophy2.png" title="100게임 이상"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.hotStreak }">
								<img width="20" src="/image/icon/good1.png" title="3연승 이상"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/good2.png" title="3연승 이상"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.freshBlood }">
								<img width="20" src="/image/icon/star1.png" title="최근 리그에 합류"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/star2.png" title="최근 리그에 합류"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.inactive }">
								<img width="20" src="/image/icon/cloud1.png" title="비활성 유저"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/cloud2.png" title="비활성 유저"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">
						<table>
							<tr>
								<td>
									<div style="position:relative;width:100px; height:30px;">
										<c:set var="rate" value="${(lg.wins / (lg.wins + lg.losses)) * 100}"/>
										<div style="position:absolute;width:${rate};height:100%;background-color:#0099FF;" >
											<c:if test="${lg.wins != 0 }">
						    				<div style="text-align:left;line-height:30px;color:white;padding-left:2px">${lg.wins }승</div>
						    				</c:if>
						  				</div>
					  					<div style="position:absolute;left:${rate };width:${100-rate};height:100%;background-color:#FF3333" >
						  					<c:if test="${lg.losses != 0 }">
						    				<div style="text-align:right;line-height:30px;color:white;padding-right:2px">${lg.losses }패</div>
						    				</c:if>
					  					</div>
									</div>
								</td>
								<td style="padding-left: 5px;"><font color="grey"><fmt:formatNumber pattern="0">${rate }</fmt:formatNumber>%</font></td>
							</tr>
						</table>
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${map2.entries[0].division eq 'I'}">
								<c:set var="f" value="${fn:substring(lg.progress,0,1) }"/>
								<c:choose>
									<c:when test="${f == 'W' }">
										<font size="3" color="blue"><b>${f }</b></font>
									</c:when>	
									<c:when test="${f == 'L' }">
										<font size="3" color="red"><b>${f }</b></font>
									</c:when>
								</c:choose>
								<c:set var="s" value="${fn:substring(lg.progress,1,2) }"/>
								<c:choose>
									<c:when test="${s == 'W' }">
										<font size="3" color="blue"><b>${s }</b></font>
									</c:when>	
									<c:when test="${s == 'L' }">
										<font size="3" color="red"><b>${s }</b></font>
									</c:when>
								</c:choose>
								<c:set var="t" value="${fn:substring(lg.progress,2,3) }"/>
								<c:choose>
									<c:when test="${t == 'W' }">
										<font size="3" color="blue"><b>${t }</b></font>
									</c:when>	
									<c:when test="${t == 'L' }">
										<font size="3" color="red"><b>${t }</b></font>
									</c:when>
								</c:choose>
								<c:set var="fo" value="${fn:substring(lg.progress,3,4) }"/>
								<c:choose>
									<c:when test="${fo == 'W' }">
										<font size="3" color="blue"><b>${fo }</b></font>
									</c:when>	
									<c:when test="${fo == 'L' }">
										<font size="3" color="red"><b>${fo }</b></font>
									</c:when>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:set var="f" value="${fn:substring(lg.progress,0,1) }"/>
								<c:choose>
									<c:when test="${f == 'W' }">
										<font size="3" color="blue"><b>${f }</b></font>
									</c:when>	
									<c:when test="${f == 'L' }">
										<font size="3" color="red"><b>${f }</b></font>
									</c:when>
								</c:choose>
								<c:set var="s" value="${fn:substring(lg.progress,1,2) }"/>
								<c:choose>
									<c:when test="${s == 'W' }">
										<font size="3" color="blue"><b>${s }</b></font>
									</c:when>	
									<c:when test="${s == 'L' }">
										<font size="3" color="red"><b>${s }</b></font>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<c:set var="cnt" value="${cnt+1 }"/>
				</c:forEach>
				<tr height="1" bgcolor="grey"><td colspan="5"></td></tr>
				<c:forEach var="lg" items="${map.rList }">
				<c:choose>
					<c:when test="${map2.entries[0].playerOrTeamName == lg.playerOrTeamName }">
						<tr bgcolor="aqua">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
					<td align="center">${cnt }</td>
					<td><font size="3">${lg.playerOrTeamName }</font></td>
					<td align="center">
						<c:choose>
							<c:when test="${lg.veteran }">
								<img width="20" src="/image/icon/trophy1.png" title="100게임 이상"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/trophy2.png" title="100게임 이상"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.hotStreak }">
								<img width="20" src="/image/icon/good1.png" title="3연승 이상"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/good2.png" title="3연승 이상"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.freshBlood }">
								<img width="20" src="/image/icon/star1.png" title="최근 리그에 합류"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/star2.png" title="최근 리그에 합류"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${lg.inactive }">
								<img width="20" src="/image/icon/cloud1.png" title="비활성 유저"/>
							</c:when>
							<c:otherwise>
								<img width="20" src="/image/icon/cloud2.png" title="비활성 유저"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">
						<table>
							<tr>
								<td>
									<div style="position:relative;width:100px; height:30px;">
										<c:set var="rate" value="${(lg.wins / (lg.wins + lg.losses)) * 100}"/>
										<div style="position:absolute;width:${rate};height:100%;background-color:#0099FF;" >
											<c:if test="${lg.wins != 0 }">
						    				<div style="text-align:left;line-height:30px;color:white;padding-left:2px">${lg.wins }승</div>
						    				</c:if>
						  				</div>
					  					<div style="position:absolute;left:${rate };width:${100-rate};height:100%;background-color:#FF3333" >
						  					<c:if test="${lg.losses != 0 }">
						    				<div style="text-align:right;line-height:30px;color:white;padding-right:2px">${lg.losses }패</div>
						    				</c:if>
					  					</div>
									</div>
								</td>
								<td style="padding-left: 5px;"><font color="grey"><fmt:formatNumber pattern="0">${rate }</fmt:formatNumber>%</font></td>
							</tr>
						</table>
					</td>
					<td align="center"><font size="3"><b>${lg.leaguePoints }</b></font></td>
				</tr>
				<c:set var="cnt" value="${cnt+1 }"/>
				</c:forEach>
			</table>
		</td>
	</tr>
</table>