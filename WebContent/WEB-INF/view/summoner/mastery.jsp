<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
#absolute6343, #absolute6111, #absolute6114, #absolute6121, #absolute6122, #absolute6123, #absolute6131, #absolute6134, #absolute6141,
#absolute6142, #absolute6143, #absolute6151, #absolute6154, #absolute6161, #absolute6162, #absolute6164, #absolute6311, #absolute6312,
#absolute6321, #absolute6322, #absolute6323, #absolute6331, #absolute6332, #absolute6341, #absolute6342, #absolute6351, #absolute6352,
#absolute6361, #absolute6362, #absolute6363, #absolute6211, #absolute6212, #absolute6221, #absolute6223, #absolute6222, #absolute6231,
#absolute6232, #absolute6241, #absolute6242, #absolute6243, #absolute6251, #absolute6252, #absolute6261, #absolute6262, #absolute6263 {
	position: absolute;
	z-index: 5;
}
#absolute6111 {top:23px; left:77px;}	#absolute6311 {top:23px; left:340px;}	#absolute6211 {top:23px; left:603px;}
#absolute6114 {top:23px; left:155px;}	#absolute6312 {top:23px; left:418px;}	#absolute6212 {top:23px; left:682px;}

#absolute6121 {top:95px; left:30px;}	#absolute6321 {top:95px; left:293px;}	#absolute6221 {top:95px; left:557px;}
#absolute6122 {top:95px; left:114px;}	#absolute6322 {top:95px; left:378px;}	#absolute6223 {top:95px; left:641px;} 
#absolute6123 {top:95px; left:196px;}	#absolute6323 {top:95px; left:459px;}	#absolute6222 {top:95px; left:723px;}

#absolute6131 {top:166px; left:76px;}	#absolute6331 {top:166px; left:340px;}	#absolute6231 {top:166px; left:603px;}
#absolute6134 {top:166px; left:155px;}	#absolute6332 {top:166px; left:418px;}	#absolute6232 {top:166px; left:682px;}

#absolute6141 {top:240px; left:30px;}	#absolute6341 {top:240px; left:293px;}	#absolute6241 {top:240px; left:557px;}
#absolute6142 {top:240px; left:115px;}	#absolute6342 {top:240px; left:378px;}	#absolute6242 {top:240px; left:641px;}
#absolute6143 {top:240px; left:196px;}	#absolute6343 {top:240px; left:459px;}	#absolute6243 {top:240px; left:723px;}

#absolute6151 {top:312px; left:76px;}	#absolute6351 {top:312px; left:343px;}	#absolute6251 {top:312px; left:603px;}
#absolute6154 {top:312px; left:155px;}	#absolute6352 {top:312px; left:418px;}	#absolute6252 {top:312px; left:682px;}

#absolute6161 {top:388px; left:37px;}	#absolute6361 {top:388px; left:293px;}	#absolute6261 {top:388px; left:557px;}
#absolute6162 {top:388px; left:115px;}	#absolute6362 {top:388px; left:378px;}	#absolute6262 {top:388px; left:641px;}
#absolute6164 {top:388px; left:196px;}	#absolute6363 {top:388px; left:460px;}	#absolute6263 {top:388px; left:723px;}
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
										<c:set var="a" value="0"/>
										<c:set var="b" value="0"/>
										<c:set var="c" value="0"/>
										<c:forEach var="s" items="${m.masteries }">
											<c:choose>
												<c:when test="${fn:substring(s.id,0,2) == '61' }">
													<c:set var="a" value="${a+s.rank }"/>
												</c:when>
												<c:when test="${fn:substring(s.id,0,2) == '63' }">
													<c:set var="b" value="${b+s.rank }"/>
												</c:when>
												<c:when test="${fn:substring(s.id,0,2) == '62' }">
													<c:set var="c" value="${c+s.rank }"/>
												</c:when>
											</c:choose>
											<div id="absolute${s.id }">
												<img width="48" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/mastery/${s.id }.png">
											</div>
										</c:forEach>
									</div>
								</td>
								<td style="vertical-align: text-top; padding-top: 20px">
									<font size="2">흉포 : ${a } / 책략 : ${b } / 결의 : ${c }</font>
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