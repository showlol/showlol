<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * 로그인 * *</h2>
ID : <input type="email" id="id" placeholder="email을 입력하세요." /><br/>
PASS : <input type="password" id="pass" /><br/>
<input type="button" value="로그인" id="login" />
<input type="button" value="회원가입" id="bt" /><br/>
<script>
	window.onload=function() {
		document.getElementById("bt").addEventListener("click", function() {
			location.href="/join"
		});
	}
	function memberJoin(){
		alert(id.value+"/"+pass.value)
		$.ajax({
			method:"get",
			url : "/login/loginData?email="+id.value+"&pass="+pass.value
		}).done(function(r) {
			window.alert(r);
		});
	};
</script>