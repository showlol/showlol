<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 1px 2px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.buttonclick {
	background-color: #4CAF50;
	color: white;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}

.button3 {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button4:hover {
	background-color: #e7e7e7;
}

.button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}

.button5:hover {
	background-color: #555555;
	color: white;
}

#relative {
	position: relative;
}

#absolue1, #absolue2, #absolue3, #absolue4, #absolue5, #absolue6,
	#absolue7, #absolue8, #absolue9, #absolue10, #absolue11, #absolue12,
	#absolue13, #absolue14, #absolue15, #absolue16, #absolue17, #absolue18,
	#absolue19, #absolue20, #absolue21, #absolue22, #absolue23, #absolue24,
	#absolue25, #absolue26, #absolue27, #absolue28, #absolue29, #absolue30
	{
	position: absolute;
	z-index: 5;
}

#absolue1 {
	top: 374px;
	left: 25px;
}

#absolue2 {
	top: 374px;
	left: 88px;
}

#absolue3 {
	top: 375px;
	left: 160px;
}

#absolue4 {
	top: 317px;
	left: 12px;
}

#absolue5 {
	top: 313px;
	left: 74px;
}

#absolue6 {
	top: 327px;
	left: 129px;
}

#absolue7 {
	top: 266px;
	left: 34px;
}

#absolue8 {
	top: 269px;
	left: 116px;
}

#absolue9 {
	top: 227px;
	left: 75px;
}

#absolue10 {
	top: 182px;
	left: 38px;
}

#absolue11 {
	top: 178px;
	left: 109px;
}

#absolue12 {
	top: 133px;
	left: 68px;
}

#absolue13 {
	top: 110px;
	left: 123px;
}

#absolue14 {
	top: 65px;
	left: 156px;
}

#absolue15 {
	top: 38px;
	left: 213px;
}

#absolue16 {
	top: 20px;
	left: 270px;
}

#absolue17 {
	top: 1px;
	left: 334px;
}

#absolue18 {
	top: 50px;
	left: 360px;
}

#absolue19 {
	top: 5px;
	left: 400px;
}

#absolue20 {
	top: 53px;
	left: 434px;
}

#absolue21 {
	top: 5px;
	left: 466px;
}

#absolue22 {
	top: 91px;
	left: 482px;
}

#absolue23 {
	top: 45px;
	left: 511px;
}

#absolue24 {
	top: 5px;
	left: 549px;
}

#absolue25 {
	top: 38px;
	left: 597px;
}

#absolue26 {
	top: 80px;
	left: 557px;
}

#absolue27 {
	top: 131px;
	left: 579px;
}

#absolue28 {
	top: 24px;
	left: 34px;
}

#absolue29 {
	top: 207px;
	left: 188px;
}

#absolue30 {
	top: 162px;
	left: 424px;
}
</style>
<body>
	<table width="1000px" border="1">
		<tr>
			<td>
				<table width="100%">
					<tr height="50px;">
						<td style="padding-left: 10px">룬 페이지</td>
					</tr>
					<tr>
						<td align="right"><c:set var="i" value="1" /> 
						<c:if test="${list != null}">
							<c:forEach var="m" items="${list }">
								<c:choose>
									<c:when test="${m.current == true }">
										<c:set var="btcls" value="button buttonclick" />
										<c:set var="sel" value="${i-1 }" />
									</c:when>
									<c:otherwise>
										<c:set var="btcls" value="button button1" />
									</c:otherwise>
								</c:choose>
								<button type="button" class="${btcls }" id="bt${i }"
									name="runebtn" onclick="script:show(${i})" value="${m.name}">${i }.${m.name}</button>
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
				<table width="100%" border="1">
					<tr height="50px;">
						<td id="selRuneName" width="300" style="padding-left: 10px"><b>${list[sel].name }</b></td>
						<td>설명</td>
					</tr>
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
								<div id="div${j }" name="cls">
							</c:when>
							<c:otherwise>
								<div id="div${j }" name="cls" style="display: none">
							</c:otherwise>
						</c:choose>
						<table width="100%">
							<tr>
								<td><c:set var="c" value="1" />
									<div id="relative">
										<img
											src="https://s3-us-west-1.amazonaws.com/riot-api/img/rune-slot-ids.png" />

										<c:forEach var="s" items="${m.slots }">
											<div id="absolue${c }">
												<c:choose>
													<c:when test="${c > 27 }">
														<img
															src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${s.img }"
															title="${s.name}(${s.des})" width=100px; height=100px; />
													</c:when>
													<c:otherwise>
														<img
															src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/${s.img }"
															title="${s.name}(${s.des})" width=50px; height=54px; />
													</c:otherwise>
												</c:choose>
											</div>
											<c:set var="c" value="${c+1}" />
										</c:forEach>
									</div></td>
								<td width="343" style="vertical-align: text-top;">
									<div style="overflow: auto; height: 435px;">
										<table width="100%">
											<tr style="background-color: red; color: white;">
												<td height="35">표식</td>
											</tr>
											<c:forEach var="r" items="${m.reds }">
												<tr height="50">
													<td>${r}</td>
												</tr>
											</c:forEach>
											<tr style="background-color: yellow; color: white;">
												<td height="35">인장</td>
											</tr>
											<c:forEach var="r" items="${m.yellows }">
												<tr height="50">
													<td>${r}</td>
												</tr>
											</c:forEach>
											<tr style="background-color: blue; color: white;">
												<td height="35">문양</td>
											</tr>
											<c:forEach var="r" items="${m.blues }">
												<tr height="50">
													<td>${r}</td>
												</tr>
											</c:forEach>
											<tr style="background-color: purple; color: white;">
												<td height="35">정수</td>
											</tr>
											<c:forEach var="r" items="${m.blacks }">
												<tr height="50">
													<td>${r}</td>
												</tr>
											</c:forEach>
										</table>
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
   function show(index) {
	  var tmp = document.getElementsByName("cls");
	  var bt = document.getElementsByName("runebtn");
      for(var i=0; i<tmp.length; i++) {
         tmp[i].style.display = "none";
         bt[i].className = "button button1";
         
      }
      document.getElementById("div"+index).style.display = "block";
      document.getElementById("bt"+index).className = "button buttonclick";
      document.getElementById("selRuneName").innerHTML = document.getElementById("bt"+index).value;
   }  
      
</script>




