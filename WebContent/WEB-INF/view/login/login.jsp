<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * �α��� * *</h2>
<div id="danger">
</div>
ID : <input type="email" id="id" placeholder="email�� �Է��ϼ���." /><br/>
PASS : <input type="password" id="pass" /><br/>
<input type="button" value="�α���" id="login" />
<input type="button" value="ȸ������" id="bt" /><br/>
<script>
	window.onload=function() {
		document.getElementById("bt").addEventListener("click", function() {
			location.href="/join"
		});
		document.getElementById("login").addEventListener("click", function() {
			login();
		});
	}
	function login(){
		$.ajax({
			method:"get",
			url : "/login/loginData?email="+id.value+"&pass="+pass.value
		}).done(function(r) {
			window.alert(r);
			if(r=="false") {
				document.getElementById("danger").innerHTML = "�α��ο� �����ϼ̽��ϴ�.";
			} else {
				location.href="";
			}
		});
	};
</script>