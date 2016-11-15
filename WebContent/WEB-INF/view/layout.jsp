<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
<title>Insert title here</title>
<link href="/css/main.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<header>			
		<tiles:insertAttribute name="header" />
	</header>
	
	<div class="jumbotron text-center">		
			<article class="success">			
				<tiles:insertAttribute name="article" />					
			</article>
		
	</div>
	<div class="right"></div>		
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>		
</body>
</html>