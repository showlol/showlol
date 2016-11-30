<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	a{
		font-family: 'Oswald', sans-serif;
	}
	font{
		font-family: 'Oswald', sans-serif;
	}
</style>
<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: #339966;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">ShowLOL</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="/">Home</a></li>
				<li><a href="/tactics/">Tactics</a></li>
				<li><a href="/community/review2">Community</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${nick==null }">
				<li><a href="/join"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				</c:if>
				<li id="logInfo"><a href="#" data-toggle="modal"
					data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Modal -->
<div id="loginModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm">
	
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="font-family: 'Oswald', sans-serif;">Login page</h4>
			</div>
			<div class="modal-body">
				<div id="danger"></div>
				<font>ID : <input type="email" id="id" placeholder="email을 입력하세요." style="font-family: 'Nanum Gothic', sans-serif;" /></font> <br />
				<font>PASS : <input type="password" id="pass" /></font> <br />
				<input type="button" value="login" id="login" style="font-family: 'Oswald', sans-serif;" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: 'Oswald', sans-serif;">Close</button>
			</div>
		</div>

	</div>
</div>


<script>
	
	var logInfo = "<div style='height: inherit; padding-right: 15px; padding-top:7px;'>"+
					"<a href='/information?nick=${nick}' style='color: white; font-family: 'Oswald', sans-serif;'>My Info</a><br/><a href='javascript:logout()' style='color: white; font-family: 'Oswald', sans-serif;'>Logout</a><div>";	
	$("header.jsp").ready(function(){
		loginCheck();
	});
	
	function loginCheck(){
		if(${nick!=null}){
			document.getElementById("logInfo").innerHTML = logInfo;	
		} else {
			document.getElementById("logInfo").innerHTML = "<a href='#' data-toggle='modal' data-target='#loginModal'><span class='glyphicon glyphicon-log-in'></span> Login</a>";
		}
	}
	

	function logout(){
		$.ajax({
			type : "get",
			url : "/logout"
		}).done(function(out) {
			if(out=="success") {
				document.getElementById("logInfo").innerHTML = "<a href='#' data-toggle='modal' data-target='#loginModal'><span class='glyphicon glyphicon-log-in'></span> Login</a>";
				location.href="/";
			}
		});
	}	
	document.getElementById("login").addEventListener("click", function() {
		login();
	});
	$("#pass").change(function() {
		login();
	});
	function login(){
		
		$.ajax({
			method:"get",
			url : "/login/loginData?email="+id.value+"&pass="+pass.value
		}).done(function(r) {
			if(r=="false") {
				document.getElementById("danger").innerHTML = "로그인에 실패하셨습니다.";
			} else {
				loginCheck();
				location.reload();
			}
		});
	};
</script>
