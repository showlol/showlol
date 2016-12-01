<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="jquery-3.1.1.js" ></script>
</head>
<c:if test="${sessionScope.id!=null }" >
	<input type="hidden" id="nick" value="aaa" >
</c:if>

!web socket<div id="clock" ></div>
url:${header.host }/
uri:${pageContext.request.requestURI }
<br/>
<div id="view" style="width: auto; height: 300px; background:#FAF4C0; overflow: auto; " >
<b id="a" >여기는 채팅창</b></br>
</div>
<input type="text" id="chat" size="70%">

<script>	
	var socket;	
	var clockSoc;
	var nick;
	var view = document.getElementById("view");
	$(document).ready(function(){
		isLogin();
		connect();
		$("#chat").change(sendChat);
		
//		clock();
	});	
	
	function isLogin(){
		if($("#nick").val()==null){
			nick="Guest"+(parseInt(Math.random()*10e3));
			return false;
		}
		return true;
	}	
	
	function connect(){
		var uri ="ws://${header.host}/socket/chat.do";
		
		try {
			socket = new WebSocket(uri);
			socket.onopen = function(args) {
				
				$("#view").html(socket + " is success<br/>");
				$("#view").append(nick+"님 입장을 환영합니다.<br/>")
				socket.send(nick+"#@/nick#@"+nick+"#@##null");				
			};
			
			socket.onmessage = function(e) {				
				var msg = e.data;				
				$("#view").append(msg + "<br/>")
								
				view.scrollTop=view.scrollHeight;
			//	$("#view").append($("#bottom"));
			//	location.href="#bottom";
			}

		}catch(e){
			alert(e.message);
		}	
	}
/*
 * 채팅 관련 함수
 */
 	var scope="/all"; // 채팅 범위
 	var target="null";
 	var content="null";
	var cmd = "/all/w/nick";
	function sendChat(){
		try{
			
			//scope 설정
			var content=$("#chat").val();
			var payLoad;
			if($("#chat").val().trim().charAt(0)=="/"){
				var temp = $("#chat").val().split(" ");				
				if(isCorrectScope(temp[0])){					
					scope = temp[0];
					target = temp[1];
					if(scope=="/w"){
						if(temp.length<3)
							throw new Error("대상이 없습니다.");
						content=temp[2];					
						
					}						
					if(scope=="/nick")
						nick=target;
				}else{
					throw new Error("잘못된 명령입니다.");
 				}
			}		
			socket.send(nick+"#@"+scope+"#@"+target+"#@##"+content);
			$("#chat").val("");
			scope="/all";
		}catch(e){
			alert(e);
			console.log(e);
		}		
	}
	function isCorrectScope(command){		
		if(cmd.search(command)==-1 ){
			return false;
		}else{			
			return true;
		}
	}

// 시간을 받아오는 함수
	function clock(){
		clockSoc = new WebSocket("ws://localhost/socket/clock.do");
		try{
			clockSoc.onopen=function(){
				console.log("시계 작동");
				clockSoc.send("start");
			};
			clockSoc.onmessage=function(e){
				var msg = e.data;
				$("#clock").html(msg);
			}
			
			
		}catch(e){
			alert(e);
		}		
	}	
	
</script>