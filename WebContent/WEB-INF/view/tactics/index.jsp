<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
CHAMPION<br/><hr/>

<c:if test="${champList!=null }">
	<div id="champContainer">
		<c:set var="col" value="0" />
		<c:forEach var="list" items="${champList}">
			<a href="javascript:champTactics('${list.NAME }', '${list.KEY }')">
				<div id="champPortrait">			
					<img src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${list.IMAGE1 }"
						 height="50" width="50"/><br/>
					<span style='overflow-y: hidden;'>${list.NAME }</span>
				</div>
			</a>			
		</c:forEach>
	</div>	
</c:if>
<hr/>
<%-- 최근 게시글 --%>
<table class="table table-hover info">
	<thead>
		<tr>
			<th>글번호<th>제목<th>작성자<th>작성일
		</tr>	
	</thead>
	<tbody >
		<c:forEach var="row" items="${list }">
			<tr class="info">
				<td id="num">${row.num }<td>${row.title }<td>${row.writer }
				<td><fmt:formatDate value="${row.writeDate }" pattern="MM/dd hh:mm" />
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- 챔프별 게시판 --%>
	<table class="table table-hover " id="tacticsList" style="display: none;">
		<thead>
			<tr>
				<th>글번호<th>제목<th>작성자<th>작성일
			</tr>		
		</thead>		
		<tbody></tbody>
	</table>
	<button id="writeTactics" class='btn btn-success' style="display:none; float:right;">공략쓰기</button>
	
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/util/DateFormat.js" ></script>
<script>

	$("tbody").click(function(e){
		console.log($(e.target).siblings("#num").html());
		location.href = "/tactics/read/" + $(e.target).siblings("#num").html();
	});
	
	function champTactics(name, key){
 		$("#tacticsList").children("tbody").html("");
		$.get("/tactics/"+name, function(r){
			console.log(r);
			appendList(r, name, key);
		});
	}
	function appendList(r, name, key){
		$("#tacticsList").show();
		for(var i=0; i<r.length; i++){
			var millis = new Date(r[i].writeDate);
			var now = new Date();
			var time;
			if(millis.getDate()<now.getDate()){
				time = millis.format("m/dd");
			}else{
				time = millis.format("h:MM");
			}
			
			$("#tacticsList").children("tbody").append(
				"<tr class='danger'><td id='num'>"+r[i].num+"<td>"
				+r[i].title+"<td>"+r[i].writer+"<td>"+time+"</tr>")			
		}
		$("#writeTactics").show().click(function(){
			if(${nick==null }){
				alert("로그인이 필요합니다.");
				return false;
			}
				 
			location.href="/tactics/regArticle/"+name+"/"+key;
		});
		location.href="#tacticsList";
	}	
</script>



