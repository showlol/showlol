<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/bxslider/jquery.bxslider.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/lib/jquery.bxslider.css" rel="stylesheet" />
</head>
<body>

	<div class="container">
		<h2>${info.name }</h2>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#info">챔피언 정보</a></li>
			<li><a data-toggle="tab" href="#stat">능력치</a></li>
			<li><a data-toggle="tab" href="#skill">스킬</a></li>
			<li><a data-toggle="tab" href="#story">스토리</a></li>
			<li><a href="/champInfo/skin/${info.key }/${info.id }">스킨</a></li>
		</ul>
		
		<div class="tab-content">
			<!-- 챔피언 정보 탭 -->
			<div id="info" class="tab-pane fade in active">
				<%@include file="/WEB-INF/view/champInfo/jspf/info.jspf" %>
			</div>
			
			<!-- 능력치 탭 -->
			<div id="stat" class="tab-pane fade">
				<%@include file="/WEB-INF/view/champInfo/jspf/stats.jspf" %>
			</div>
			
			<!-- 스킬 탭 -->
			<div id="skill" class="tab-pane fade">
				<%@include file="/WEB-INF/view/champInfo/jspf/skill.jspf" %>
			</div>
			
			<!-- 스토리 탭 -->
			<div id="story" class="tab-pane fade">
				<%@include file="/WEB-INF/view/champInfo/jspf/story.jspf" %>
			</div>
			
			<!-- 스킨 탭 -->
			<div id="skin" class="tab-pane fade">
				
			</div>
		</div>
	</div>
	
</body>

<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
		});
	});
</script>

