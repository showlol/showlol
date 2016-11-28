<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
table {
    border-collapse: collapse;
}

th {
    text-align: center;
    padding: 3px;
}

td {
    font-size: small;
    font-family: sans-serif;
    padding: 1px;
    border-
}

th {
    background-color: #4CAF50;
    color: white;
}

</style>
<div style="text-align: center;">
	<img width="400" src="/image/lol.png" style="padding: 50px;"/>
</div>
<div style="text-align: center;">
	<form action="/summoner/index" method="post" style="display:inline;" id="search">
		<input type="text" name="userName" value="${sname }" style="font-size: 24;" list="hist" required="required" id="tt"/>
		<datalist id="hist">
			<c:set var="arr" value="${fn:split(hist, ',') }"/>
			<c:forEach var="h" items="${arr }">
				<option class="item" value="${h }" />
			</c:forEach>
		</datalist>
		<input type="submit" value="검색" style="font-size: 24;"/>
	</form>
</div>

<div align="center">
<h2>Challenger 랭킹</h2>
<table border="1" style="padding: 100px;" id="table">
	<tr height="50" align="center">
		<th width="50"></th>
		<th width="150">소환사</th>
		<th width="100">티어</th>
		<th width="100">LP</th>
		<th width="150">승률</th>
	</tr>
	
	<c:set var="cnt" value="1"/>
	<c:forEach var="i" items="${list }">
		<tr height="40" style="border-style: solid; border-bottom-color: #000000; border-width:1px;" >
			<td align="center">${cnt }</td>
			<td><b>${i.playerOrTeamName }</b></td>
			<td align="center">Challenger</td>
			<td align="center">${i.leaguePoints } LP</td>
			<td align="center">
			<table>
				<tr>
					<td>
						<div style="position:relative;width:150px; height:30px;">
							<c:set var="rate" value="${(i.wins / (i.wins + i.losses)) * 150}"/>
							<div style="position:absolute;width:${rate};height:100%;background-color:#0099FF;border-top-left-radius: 5px;border-bottom-left-radius: 5px;" >
								<c:if test="${i.wins != 0 }">
			    				<div style="text-align:left;line-height:30px;color:white;padding-left:5px">${i.wins }승</div>
			    				</c:if>
			  				</div>
		  					<div style="position:absolute;left:${rate };width:${150-rate};height:100%;background-color:#FF3333;border-top-right-radius: 5px;border-bottom-right-radius: 5px;" >
			  					<c:if test="${i.losses != 0 }">
			    				<div style="text-align:right;line-height:30px;color:white;padding-right:5px">${i.losses }패</div>
			    				</c:if>
		  					</div>
						</div>
					</td>
					<td style="padding-left: 5px;"><font color="grey"><fmt:formatNumber pattern="0">${rate }</fmt:formatNumber>%</font></td>
				</tr>
			</table>
			</td>
		</tr>
		<c:set var="cnt" value="${cnt+1 }"/>
	</c:forEach>
</table>
</div>
<div id="showBtn" align="center" style="padding:10px;">
	<input type="hidden" id="startIdx" value="${cnt}"/>
	<input type="button" value="더보기" onclick="showover()" style="width: 580px;"/>
</div>

<script>
	function showover() {
		var idx = $("#startIdx").val();
		var stidx = parseInt(idx)-1;
		$.ajax(
			{
			"method" : "get",
			"url" : "/index/challenger?startIdx="+stidx,
			"async" : false
			}
		).done(function(obj) {
			var table = $("#table").html();
			$("#table").html(table + obj);
			if(idx > 180)
				document.getElementById("showBtn").style.display = "none";
			else
				$("#startIdx").val(parseInt(idx)+20);
		}).fail(function() {
			alert("ERROR");
		});
	}
	/* $("#tt").on("input", function(){
		$(".item").each(function(){
			if($(this).val() == $("#tt").val()) {
				$("#search").submit();
			}
		});
	}); */
	
</script>
