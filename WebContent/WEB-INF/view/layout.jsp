<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/css/main.css" rel="stylesheet" >
</head>
<body>
	<div class="container">
		<header>			
			<tiles:insertAttribute name="header" />
		</header>		
		<nav>			
			<tiles:insertAttribute name="nav" />
		</nav>
		<article>
			<tiles:insertAttribute name="article" />					
		</article>		
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>	
</body>
</html>