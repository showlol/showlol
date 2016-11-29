<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<h2 style="font-family: 'Oswald', sans-serif;">Join</h2>
<font style="font-family: 'Oswald', sans-serif;">ID : <input type="email" id="memberid" placeholder="email을 입력하세요."></font><br/>
<font style="font-family: 'Oswald', sans-serif;">PASS : <input type="password" id="memberpass" ></font><br/>
<font style="font-family: 'Oswald', sans-serif;">NICK : <input type="text" id="nick" ></font><br/>
<font style="font-family: 'Oswald', sans-serif;">GAMEID : <input type="text" id="gameid" ></font><br/>
<input type="button" value="입력 완료" id="create" />
<hr/>
<h3 style="font-family: 'Oswald', sans-serif;">E-mail Confirm</h3>
<input type="text" name="authuuid" size="30" id="authuuid" /> <input type="button" value="인증하기" id="auth"/>
<script>
		document.getElementById("create").addEventListener("click", function() {
			sendEmail();
		});
		$("#gameid").change(function() {
			sendEmail();
		});
		document.getElementById("auth").addEventListener("click", function() {
			authEmail();
		});
		$("#authuuid").change(function() {
			authEmail();
		});
	function memberJoin(){
		$.ajax({
			method:"get",
			url : "/member/regist?email="+memberid.value+"&pass="+memberpass.value+"&nick="+nick.value+"&gameid="+gameid.value
		}).done(function() {
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
			window.alert("회원가입이 완료되었습니다.");
			location.href="/";
		});
	};
</script>