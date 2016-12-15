<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>
<title>ShowLOL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap.css">
<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
</head>
<body style="margin: 0; padding: 0; height: 100%">
	<header>	
		<tiles:insertAttribute name="header" />
	</header>
	<article style="overflow: scroll; ">		
		<div id="top"></div>	
		<tiles:insertAttribute name="article" />			
	</article>
	<footer style="position: fixed; bottom: 0; width: 100%;height: 30px;">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>
<script>
	if(navigator.userAgent.toLowerCase().includes("trident"))
		alert("Internet Explore에서는 정상 작동하지 않습니다.\n Chrom 브라우저에 최적화 되있습니다. \n"+
				"It does not work in Internet Explorer. \ NYou are optimized for Chrom browser.");
	
	
</script>
