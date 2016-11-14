<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * 회원가입 * *</h2>
ID : <input type="email" id="id" ><br/>
PASS : <input type="password" id="pass" ><br/>
NICK : <input type="text" id="nick" ><br/>
GAMEID : <input type="text" id="gameid" ><br/>
<input type="button" value="입력 완료" id="bt" >

<script>
	window.onload=function() {
		document.getElementById("bt").addEventListener("click", function() {
			memberJoin();
		});
	}
	function memberJoin(){
		alert(id.value+"/"+pass.value)
		$.ajax({
			method:"get",
			url : "/member/regist?email="+id.value+"&pass="+pass.value+"&nick="+nick.value+"&gameid="+gameid.value
		}).done(function(r) {
			window.alert(r);
		});
	};
</script>