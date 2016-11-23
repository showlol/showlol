<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2>회원가입</h2>
ID : <input type="email" id="memberid" placeholder="email을 입력하세요."><br/>
PASS : <input type="password" id="memberpass" ><br/>
NICK : <input type="text" id="nick" ><br/>
GAMEID : <input type="text" id="gameid" ><br/>
<input type="button" value="입력 완료" id="create" />
<hr/>
<h3>E-mail 인증</h3>
<input type="text" name="authuuid" size="30" id="authuuid" /> <input type="button" value="인증하기" id="auth"/>
<script>
		document.getElementById("create").addEventListener("click", function() {
			sendEmail();
		});
		document.getElementById("auth").addEventListener("click", function() {
			authEmail();
		});
	function memberJoin(){
		alert(memberid.value+"/"+memberpass.value)
		$.ajax({
			method:"get",
			url : "/member/regist?email="+memberid.value+"&pass="+memberpass.value+"&nick="+nick.value+"&gameid="+gameid.value
		}).done(function(r) {
			window.alert(r);
			location.href="/";
		});
	};
	//인증 이메일 보내기
	function sendEmail() {
		var url = "/member/auth?email="+document.getElementById("memberid").value;
		var xhr = new XMLHttpRequest();
		xhr.open("get", url, false);
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4 && xhr.status==200) {
				var resp = xhr.responseText;
				if(resp == "Y") {
					window.alert("인증키가 발송되었습니다.");
				} else {
					window.alert("인증키 발송이 실패하였습니다.");
				}
			}
		};
		xhr.send();
	};
	//인증 확인
	function authEmail() {
		$.ajax({
			method : "get",
			url : "/member/complete?email="+document.getElementById("memberid").value+"&uuid="+authuuid.value
		}).done(function() {
			memberJoin();
			window.alert("회원가입 되셨습니다.");
			location.href="/";
		});
	};
</script>