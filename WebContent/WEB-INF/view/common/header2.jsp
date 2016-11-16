<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="container" >
	<nav id="navigation">
		<span id="nickname" style="float: left;">
		</span>
		<ul class="clearfix">				
			<li><div id="mi"><a href="/tactics/1/10">tactics</a></div></li>
			<li><div id="mi"><a>static</a></div></li>			
			<li><div id="mi"><a>home</a></div></li>					
		</ul>
	</nav>	
		<br/>
</div>

<script>
	if(${nick==null}) {
		$("#nickname").html("login");
	} else {
		$("#nickname").html("${nick} 님");
	}
</script>		