<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/bxslider/jquery.bxslider.js"></script>
<h2>스킨</h2>

<body>
<ul class="bxslider">
	<c:forEach var="i" items="${skins }">
		<li ><img src="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${name }_${i.num }.jpg" 
		width="800px;" title="${i.name }"/></li>
	</c:forEach>
</ul>

<input type="button" value="이전" onclick="back()" class="btn-sm btn-primary"/>
<input type="button" value="목록" onclick="goList()" class="btn-sm btn-primary"/>
</body>

<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			mode:'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
			  speed:1000, //default:500 이미지변환 속도
			  auto: true, //default:false 자동 시작
			  captions: true, // 이미지의 title 속성이 노출된다.
			  //autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
		});
	});
	
	function goList() {
		location.href = "/champInfo/list";
	}
	
	function back() {
		history.back();
	}
	
</script>