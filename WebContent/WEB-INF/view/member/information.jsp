<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="infomem" style="display:block;">
<h2>회원 정보</h2>
<hr/>
<b>ID :</b> ${data.email }<br/>
<b>PASS :</b> <input type="password" id="passck1" /><br/>
<b>PASS CHECK :</b> <input type="password" id="passck2" placeholder="한번 더 적어주세요."/><br/>
<b>NICK :</b> ${data.nick }<br/>
<b>GAMEID :</b> ${data.gameid }<br/>
<hr/>
<input type="button" id="changeinfo" value="정보 수정"/>
<input type="button" id="delID" value="회원 탈퇴"/>
</div>

<div id="dropMem"style="display:none;">
<h2>회원 탈퇴</h2>
<h4><b>그동안 저희 사이트를 이용해주셔서 감사합니다.</b></h4>
<ul>
	<li>탈퇴 후 회원정보는 모두 삭제됩니다.</li>
	<li>탈퇴 신청시 즉시 탈퇴 처리됩니다.</li>
</ul>
<input type="email" placeholder="자신의 ID를 입력해주세요." id="delMemid"/>
<input type="button" value="탈퇴하기" id="delMem"/>
</div>

<script>
	document.getElementById("delID").addEventListener("click", function() {
		document.getElementById("infomem").style.display="none";
		document.getElementById("dropMem").style.display="block";
	});
	document.getElementById("delMem").addEventListener("click", function() {
		$.ajax({
			method : "get",
			url : "/delMem/del?email="+delMemid.value+"&nick=${data.nick}"
		});		
		location.href="/";
	});
	document.getElementById("changeinfo").addEventListener("click", function() {
		var pass1 = document.getElementById("passck1").value;
		var pass2 = document.getElementById("passck2").value;
		if(pass1!=pass2) {
			alert("비밀번호 변경 실패");
		} else {
			$.ajax({
				method : "get",
				url : "/passchange?pass="+pass1+"&email=${data.email }"
			}).done(function() {
				alert("비밀번호 변경 성공");
				location.reload();
			});
		}
	});
</script>