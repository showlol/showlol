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
#relative {
	position: relative;
}
#absolue1, #absolue2, #absolue3, #absolue4, #absolue5, #absolue6, #absolue7,
#absolue8, #absolue9, #absolue10, #absolue11, #absolue12, #absolue13, #absolue14, 
#absolue15, #absolue16, #absolue17, #absolue18, #absolue19, #absolue20, #absolue21,
#absolue22, #absolue23, #absolue24, #absolue25, #absolue26, #absolue27, #absolue28,
#absolue29, #absolue30 {
	position: absolute;
	z-index: 5;
}
#absolue1 {top:382px;left:31px;}
#absolue2 {top:382px;left:94px;}
#absolue3 {top:383px;left:166px;}
#absolue4 {top:325px;left:18px;}
#absolue5 {top:321px;left:80px;}
#absolue6 {top:335px;left:135px;}
</style>
</head>
<body>

	<div id="relative">
		<img src="https://s3-us-west-1.amazonaws.com/riot-api/img/rune-slot-ids.png"/>
	</div>	
	<c:forEach var="i" begin="1" end="30">
		<div id="absolue${i }">
		<c:choose>
			<c:when test="${i > 27 }">
			<img
			src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/bl_2_3.png"
			title="${s.name}(${s.des})" width=100px; height=100px;/>
			</c:when>
			<c:otherwise>
			<img
			src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/r_1_3.png"
			title="${s.name}(${s.des})" width=50px; height=54px;/>
			</c:otherwise>
		</c:choose>
		</div>	
	</c:forEach>
	
</body>
</html>





