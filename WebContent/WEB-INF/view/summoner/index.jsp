<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#league">리그</a></li>
			<li><a data-toggle="tab" href="#match">최근게임</a></li>
			<li><a data-toggle="tab" href="#rune">룬</a></li>
			<li><a data-toggle="tab" href="#mastery">특성</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			</div>
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
	
</script>

