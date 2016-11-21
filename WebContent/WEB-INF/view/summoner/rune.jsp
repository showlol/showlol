<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 1px 2px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.buttonclick {
	background-color: #4CAF50;
	color: white;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}

.button3 {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button4:hover {
	background-color: #e7e7e7;
}

.button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}

.button5:hover {
	background-color: #555555;
	color: white;
}

#relative1, #relative2, #relative3, #relative4, #relative5, #relative6, #relative7,
#relative8, #relative9, #relative10, #relative11, #relative12, #relative13, #relative14, 
#relative15, #relative16, #relative17, #relative18, #relative19, #relative20, #relative21,
#relative22, #relative23, #relative24, #relative25, #relative26, #relative27, #relative28,
#relative29, #relative30 {
	position: relative;
	z-index: 5;
}
#relative1 {top:-62px;left:23px;}
#relative2 {top:-117px;left:86px;}
#relative3 {top:-169px;left:160px;}
#relative4 {top:-281px;left:9px;}
#relative5 {top:-340px;left:73px;}
#relative6 {top:-379px;left:128px;}
#relative7 {top:-495px;left:32px;}
#relative8 {top:-545px;left:113px;}
#relative9 {top:-642px;left:74px;}
#relative10 {top:-740px;left:36px;}
#relative11 {top:-798px;left:109px;}
#relative12 {top:-896px;left:67px;}
#relative13 {top:-974px;left:123px;}
#relative14 {top:-1073px;left:154px;}
#relative15 {top:-1154px;left:212px;}
#relative16 {top:-1226px;left:268px;}
#relative17 {top:-1298px;left:332px;}
#relative18 {top:-1303px;left:360px;}
#relative19 {top:-1404px;left:398px;}
#relative20 {top:-1408px;left:433px;}
#relative21 {top:-1512px;left:465px;}
#relative22 {top:-1479px;left:480px;}
#relative23 {top:-1579px;left:510px;}
#relative24 {top:-1674px;left:548px;}
#relative25 {top:-1694px;left:597px;}
#relative26 {top:-1707px;left:556px;}
#relative27 {top:-1709px;left:579px;}
#relative28 {top:-1875px;left:30px;}
#relative29 {top:-1788px;left:187px;}
#relative30 {top:-1930px;left:419px;}
</style>
</head>
<body>

	<c:set var="i" value="1" />
	<c:if test="${list != null}">
		<c:forEach var="m" items="${list }">
			<c:choose>
				<c:when test="${m.current == true }">
					<c:set var="btcls" value="button buttonclick"/>
				</c:when>
				<c:otherwise>
					<c:set var="btcls" value="button button1"/>
				</c:otherwise>
			</c:choose>
			<button type="button" class="${btcls }" id="bt${i }" name="runebtn"
				onclick="script:show(${i})">${i }.${m.name}</button>
			<c:set var="i" value="${i+1}" />
		</c:forEach>
	</c:if>
	
	<div>
		<img src="https://s3-us-west-1.amazonaws.com/riot-api/img/rune-slot-ids.png"/>
	</div>
	<c:set var="j" value="1" />
	<c:if test="${list != null}">
		<c:forEach var="m" items="${list }">
			<c:choose>
				<c:when test="${m.current == true }">
					<div id="div${j }" name="cls">
				</c:when>
				<c:otherwise>
					<div id="div${j }" name="cls" style="display: none">
				</c:otherwise>
			</c:choose>
			<c:set var="c" value="1"/>
			<c:forEach var="s" items="${m.slots }">
				<div id="relative${c }">
				<c:choose>
			<c:when test="${c > 27 }">
			<img
			src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${s.img }"
			title="${s.name}(${s.des})" width=100px; height=100px;/>
			</c:when>
			<c:otherwise>
			<img
			src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${s.img }"
			title="${s.name}(${s.des})" width=50px; height=54px;/>
			</c:otherwise>
		</c:choose>
				</div>	
				<c:set var="c" value="${c+1}"/>
			</c:forEach>
			</div>
			<c:set var="j" value="${j+1}" />
		</c:forEach>
	</c:if>
</body>
</html>

<script>
   function show(index) {
	  var tmp = document.getElementsByName("cls");
	  var bt = document.getElementsByName("runebtn");
      for(var i=0; i<tmp.length; i++) {
         tmp[i].style.display = "none";
         bt[i].className = "button button1";
         
      }
      document.getElementById("div"+index).style.display = "block";
      document.getElementById("bt"+index).className = "button buttonclick";
   }  
      
</script>




