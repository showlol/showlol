<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
#absolute6343, #absolute2, #absolute3, #absolute4, #absolute5, #absolute6, #absolute7, #absolute8, #absolute9,
#absolute10, #absolute11, #absolute12, #absolute13, #absolute14, #absolute15, #absolute16, #absolute17, #absolute18,
#absolute19, #absolute20 {
	position: absolute;
	z-index: 5;
}
#absolute6343 {top:245px; left:455px;}
</style>

<body>
	<table width="1000px" border="1">
		<tr>
			<td>
				<table width="100%">
					<tr height="50px;">
						<td style="padding-left: 10px">특성 페이지</td>
					</tr>
					<tr>
						<td align="right">
						<c:set var="i" value="1" /> 
						<c:if test="${list != null}">
							<c:forEach var="m" items="${list }">
								<c:choose>
									<c:when test="${m.current == true }">
										<c:set var="btcls2" value="button buttonclick" />
										<c:set var="sel2" value="${i-1 }" />
									</c:when>
									<c:otherwise>
										<c:set var="btcls2" value="button button1" />
									</c:otherwise>
								</c:choose>
								<button type="button" class="${btcls2 }" id="bt2${i }"
									name="masterybtn" onclick="script:show2(${i})" value="${m.name}">${i }.${m.name}</button>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</c:if>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
			<table width="100%"  border="1">
			<tr height="50px;"><td id="selMasteryName" width="300" style="padding-left: 10px"><b>${list[sel2].name }</b></td></tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
				<c:set var="j" value="1" /> 
				<c:if test="${list != null}">
					<c:forEach var="m" items="${list }">
						<c:choose>
							<c:when test="${m.current == true }">
								<div id="div2${j }" name="cls2">
							</c:when>
							<c:otherwise>
								<div id="div2${j }" name="cls2" style="display: none">
							</c:otherwise>
						</c:choose>
						<table width="100%">
							<tr>
								<td>
									<div id="relative">
										<img
											src="/image/masteryboard.png" width="800"/>

										<c:forEach var="s" items="${m.masteries }">
											<div id="absolute${s.id }">
												<img width="48" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/mastery/${s.id }.png">${s.id }
											</div>
										</c:forEach>
									</div>
								</td>
							</tr>
						</table>
						</div>
						<c:set var="j" value="${j+1}" />
					</c:forEach>
				</c:if></td>
		</tr>
	</table>
</body>

<script>
   function show2(index) {
	  var tmp = document.getElementsByName("cls2");
	  var bt = document.getElementsByName("masterybtn");
      for(var i=0; i<tmp.length; i++) {
         tmp[i].style.display = "none";
         bt[i].className = "button button1";
         
      }
      document.getElementById("div2"+index).style.display = "block";
      document.getElementById("bt2"+index).className = "button buttonclick";
      document.getElementById("selMasteryName").innerHTML = document.getElementById("bt2"+index).value;
   }  
      
</script>