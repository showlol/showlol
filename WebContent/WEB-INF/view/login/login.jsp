<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * �α��� * *</h2>
ID : <input type="email" id="id" />
PASS : <input type="password" id="pass" />
<input type="button" value="ȸ������" id="bt" />
<script>
	document.getElementById("bt").addEventListener("click", function() {
		location.href="/join"
	});
</script>