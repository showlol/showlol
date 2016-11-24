<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container">
		<input type="hidden" id="userName" value="${userInfo.name }" /> 
		<img width="100"
			 src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/profileicon/${userInfo.profileIconId }.png" />
		${userInfo.name }

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">랭크</a></li>
			<li><a data-toggle="tab" href="#champion">챔피언</a></li>
			<li><a data-toggle="tab" href="#league">리그</a></li>
			<li><a data-toggle="tab" href="#match">최근게임</a></li>
			<li><a data-toggle="tab" href="#rune">룬</a></li>
			<li><a data-toggle="tab" href="#mastery">특성</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<table>
					<tr>
						<td>
							<img src="/image/tier_icons/${fn:toLowerCase(tierInfo.tier) }_${fn:toLowerCase(tierInfo.entries[0].division) }.png">
						</td>
						<td>
							<table>
								<tr><td><font color="#0033FF">${tierInfo.tier } ${tierInfo.entries[0].division }<font></td></tr>
								<tr><td><b>${tierInfo.entries[0].leaguePoints } LP</b> / ${tierInfo.entries[0].wins }승 ${tierInfo.entries[0].losses }패</td></tr>
								<tr><td>승률 <fmt:formatNumber pattern="0">${tierInfo.entries[0].wins / (tierInfo.entries[0].wins + tierInfo.entries[0].losses) * 100 }</fmt:formatNumber>%</td></tr>
								<tr><td>${tierInfo.name }</td></tr>
							</table>
						</td>
					<tr>
				</table>
			</div>
			<div id="champion" class="tab-pane fade"></div>
			<div id="league" class="tab-pane fade"></div>
			<div id="match" class="tab-pane fade"></div>
			<div id="rune" class="tab-pane fade"></div>
			<div id="mastery" class="tab-pane fade"></div>
		</div>
	</div>

</body>
</html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	window.onload = function() {
		var userName = $("#userName").val();
		initMatches(userName);
		initRunes(userName);
		initMasterys(userName);
		initLeague(userName);
		initChamp(userName);
	}
	function initMatches(name) {
		$.ajax(
			{
			"method" : "get",
			"url" : "/summoner/matches?userName=" + name,
			"async" : false
			}
		).done(function(obj) {
			$("#match").html(obj);
		}).fail(function() {
			alert("match ERROR");
		});
	}
	function initRunes(name) {
		$.ajax(
			{
			"method" : "get",
			"url" : "/summoner/runeInfo?name=" + name,
			"async" : false
			}
		).done(function(obj) {
			$("#rune").html(obj);
		}).fail(function() {
			alert("rune ERROR");
		});
	}	
	function initMasterys(name) {
		$.ajax(
			{
			"method" : "get",
			"url" : "/summoner/masterys?userName=" + name,
			"async" : false
			}
		).done(function(obj) {
			$("#mastery").html(obj);
		}).fail(function() {
			alert("mastery ERROR");
		});
	}	
	function initLeague(name) {
		$.ajax(
			{
			"method" : "get",
			"url" : "/summoner/league?userName=" + name,
			"async" : false
			}
		).done(function(obj) {
			$("#league").html(obj);
		}).fail(function() {
			alert("league ERROR");
		});
	}	
	function initChamp(name) {
		$.ajax(
			{
			"method" : "get",
			"url" : "/summoner/champion?userName=" + name,
			"async" : false
			}
		).done(function(obj) {
			$("#champion").html(obj);
		}).fail(function() {
			alert("champion ERROR");
		});
	}	
	
</script>

