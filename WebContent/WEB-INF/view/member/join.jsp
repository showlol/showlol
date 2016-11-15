<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>* * 회원가입 * *</h2>
ID : <input type="email" id="memberid" placeholder="email을 입력하세요."><br/>
PASS : <input type="password" id="memberpass" ><br/>
NICK : <input type="text" id="nick" ><br/>
GAMEID : <input type="text" id="gameid" ><br/>
<input type="button" value="입력 완료" id="create" >
<script>
	window.onload=function() {
		document.getElementById("create").addEventListener("click", function() {
			memberJoin();
		});
	}
	function memberJoin(){
		alert(memberid.value+"/"+memberpass.value)
		$.ajax({
			method:"get",
			url : "/member/regist?email="+memberid.value+"&pass="+memberpass.value+"&nick="+nick.value+"&gameid="+gameid.value
		}).done(function(r) {
			window.alert(r);
		});
	};
</script>