<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
	font{
		font-family: 'Oswald', sans-serif;
	}
</style>
<h2 style="font-family: 'Oswald', sans-serif;">Join</h2>
<font>ID : </font><input type="email" id="memberid" placeholder="email을 입력하세요." style="font-family: 'Nanum Gothic', sans-serif;" required><br/>
<font>PASS : </font><input type="password" id="memberpass" required><br/>
<font>NICK : </font><input type="text" id="nick" required><br/>
<font>GAMEID : </font><input type="text" id="gameid" style="font-family: 'Nanum Gothic', sans-serif;" required><br/>
<input type="button" class="btn-sm btn-primary" value="입력 완료" id="create" />
<hr/>
<h3 style="font-family: 'Oswald', sans-serif;">E-mail Confirm</h3>
<input type="text" name="authuuid" size="30" id="authuuid" required /> <input type="button" class="btn-sm btn-primary" value="인증하기" id="auth"/>
<script>
		document.getElementById("create").addEventListener("click", function() {
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
			async: false,
			url : "/member/regist?email="+memberid.value+"&pass="+memberpass.value+"&nick="+nick.value+"&gameid="+gameid.value
		}).done(function(r) {
			
			if(r=="true"){
				alert("가입이 완료되었습니다.")
				location.href="/";
				return true;
			}
				
			return false;
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
				console.log(resp);
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
		}).done(function(r) {		
			console.log(r);
			if(r==true){
				memberJoin();	
				
			}else{
				alert("가입에 실패하였습니다.");
			}
			
		});
	};
</script>