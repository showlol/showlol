<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">LolStatus</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>        
        <li><a href="#">STATICS</a></li>
        <li><a href="/tactics/1/10">TACTICS</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li id="logInfo"><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
        <h4 class="modal-title">로그인</h4>
      </div>
      <div class="modal-body">
        <div id="danger"></div>
			ID :
			<input type="email" id="id" placeholder="email을 입력하세요." />
			<br />
			PASS :
			<input type="password" id="pass" />
			<br />
			<input type="button" value="로그인" id="login" />
			<input type="button" value="회원가입" id="bt" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<script>

	var logInfo = "<div style='height: inherit;'>"+
					"<a>${nick }</a><br/><a href='javascript:logout()'>logout</a><div>";
	var nick="${nick}";
	if(${nick!=null}){
		document.getElementById("logInfo").innerHTML = logInfo;	
	} else {
		document.getElementById("logInfo").innerHTML = "<a href='#' data-toggle='modal' data-target='#loginModal'><span class='glyphicon glyphicon-log-in'></span> Login</a>";
	}
	function logout(){
		$.ajax({
			type : "get",
			url : "/logout"
		}).done(function(out) {
			if(out=="success") {
				document.getElementById("logInfo").innerHTML = "<a href='#' data-toggle='modal' data-target='#loginModal'><span class='glyphicon glyphicon-log-in'></span> Login</a>";
			}
		});
	}	

	document.getElementById("bt").addEventListener("click", function() {
		location.href="/join"
	});
	document.getElementById("login").addEventListener("click", function() {
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
				location.href="/";
			}
		});
	};
</script>