<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="/css/bootstrap.css" rel="stylesheet" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container" >
	<nav id="navigation">
		<div class="login">
			<span class="btn btn-success btn-ms" data-toggle="modal"
				data-target="#myModal" id="nickname" style="float: left;"></span>
		</div>

		<ul class="list-inline">
			<li><div id="mi"><a>home</a></div></li>
			<li><div id="mi"><a>static</a></div></li>					
			<li><div id="mi"><a href="/tactics/1/10">tactics</a></div></li>							
		</ul>
	</nav>	
	<br/>
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 300px; left: 200px; top: 100px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>로 그 인</b></h4>
        </div>
	    <div class="modal-body">	       
				<div id="danger"></div>
				ID :
				<input type="email" id="id" placeholder="email을 입력하세요." />
				<br />
				PASS :
				<input type="password" id="pass" />
				<br />
				<input type="button" value="로그인" id="login" />
				<input type="button" value="회원가입" id="bt" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>  


<script>
	if(${nick==null}) {
		$("#nickname").html("login");
	} else {
		$("#nickname").html("${nick} 님");
	}
	
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
		}).done(function(r) {
			if(r=="false") {
				document.getElementById("danger").innerHTML = "로그인에 실패하셨습니다.";
			} else {
				window.alert(r);
				location.href="/";
			}
		});
	};
</script>		