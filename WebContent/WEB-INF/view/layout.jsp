<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
  <title>Bootstrap Case</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/css/main.css" >
</head>
<body>
	<div style="height: 70px">
		<header>			
			<tiles:insertAttribute name="header" />
		</header>
	</div>
	<div style="min-height: 50%; overflow-y: auto;">
		<article>			
			<tiles:insertAttribute name="article" />					
		</article>
	</div>	
	<div>	
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>			
</body>
</html>