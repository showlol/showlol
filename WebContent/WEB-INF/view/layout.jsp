<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<title>Bootstrap Case</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
</head>
<body>

	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<article  style="min-height: 500px; padding: 60px;">
		<div class="container">
			<tiles:insertAttribute name="article" />
		</div>
	</article>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>