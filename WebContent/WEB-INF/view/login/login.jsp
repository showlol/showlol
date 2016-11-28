<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * 로그인 * *</h2>
<div id="danger"></div>
ID :
<input type="email" id="id" placeholder="email을 입력하세요." />
<br />
PASS :
<input type="password" id="pass" />
<br />
<input type="button" value="로그인" id="login" />
<input type="button" value="회원가입" id="bt" />
<br />
<script>
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
		}).done(function() {
			if(r=="false") {
				document.getElementById("danger").innerHTML = "로그인에 실패하셨습니다.";
			} else {
				location.href="/";
			}
		});
	};
</script>