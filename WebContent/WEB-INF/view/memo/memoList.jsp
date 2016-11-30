<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
    border-collapse: collapse;
    width: 500px;
}

th, td {
    text-align: center;
    padding: 8px;
    font-family: 'Nanum Gothic', sans-serif;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}
a:link, a:visited {
    background-color: green;
    color: white;
    padding: 14px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}
</style>

<div id="board">
<div class="container">
  <h2 style="font-family: 'Nanum Gothic', sans-serif;">쪽지함</h2>
  <ul class="nav nav-tabs">
  	<c:choose>
  		<c:when test="${mode == 1 }">
  			<li class="active"><a href="#receivce">받은 쪽지함</a></li>
   			<li><a href="#send" >보낸 쪽지함</a></li>
  		</c:when>
  		<c:otherwise>
 			<li><a href="#receivce">받은 쪽지함</a></li>
   			<li class="active"><a href="#send">보낸 쪽지함</a></li>
  		</c:otherwise>
  	</c:choose>
  </ul>

  <div class="tab-content">
  	<c:choose>
  		<c:when test="${mode == 1 }">
  			<div id="receivce" class="tab-pane fade in active">
  		</c:when>
  	  	<c:otherwise>
  			<div id="receivce" class="tab-pane fade">
	  	</c:otherwise>
    </c:choose>
      <table>
      	<tr>
      		<th width="200">제목</th>
      		<th width="100">보낸사람</th>
      		<th width="100">날짜</th>
    	</tr>
      	<c:forEach var="i" items="${tList }">
      		<tr>
      			<td>${i.TITLE }</td>
      			<td>${i.WRITETO }</td>
      			<td><fmt:formatDate value="${i.REGDATE }" pattern="yyyy-MM-dd"/></td>
      		</tr>
      	</c:forEach>
      </table>
      <div align="center" style="padding-top: 20px;">
      <c:forEach var="i" begin="1" end="${tMax }">
      	<a href="/memo/list?page=${i}&mode=1">${i }</a> 
      </c:forEach>
      </div>
    </div>
    <c:choose>
  		<c:when test="${mode == 2 }">
  			<div id="send" class="tab-pane fade in active">
  		</c:when>
  	  	<c:otherwise>
  			<div id="send" class="tab-pane fade">
	  	</c:otherwise>
    </c:choose>
      <table>
      	<tr>
      		<th width="200" align="center">제목</th>
      		<th width="100">받는사람</th>
      		<th width="100" align="center">날짜</th>
    	</tr>
      	<c:forEach var="i" items="${fList }">
      		<tr>
      			<td align="left"><a onclick="readMemo(${i.IDX })">${i.TITLE }</a></td>
      			<td>${i.WRITETO }</td>
      			<td align="center"><fmt:formatDate value="${i.REGDATE }" pattern="yyyy-MM-dd HH:mm"/></td>
      		</tr>
      	</c:forEach>
      </table>
      <div align="center" style="padding-top: 20px;">
      <c:forEach var="i" begin="1" end="${fMax }">
      	<a href="/memo/list?page=${i}&mode=2">${i }</a> 
      </c:forEach>
      </div>
    </div>
  </div>
</div>
</div>

<div id="read">
	<table class="table table-bordered">
		<tr>
			<th>제목</th>
			<td id="title"></td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td id="from"></td>
		</tr>
		<tr>
			<th>받는사람</th>
			<td id="to"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="memo" cols="50" rows="10" style="resize: none;" ></textarea></td>
		</tr>
	</table>
	<div align="right"><input class="btn btn-success" type="button" value="목록으로" onclick="goBoard()"/></div>
</div>
<script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
    document.getElementById("read").style.display = "none";
});

function readMemo(idx) {
	$.ajax(
		{
		"method" : "get",
		"url" : "/memo/read?idx="+idx,
		"async" : false
		}
	).done(function(obj) {
		$("#title").html(obj.TITLE);
		$("#from").html(obj.WRITEFROM);
		$("#to").html(obj.WRITETO);
		$("#memo").html(obj.CONTENT);
		document.getElementById("board").style.display = "none";
		document.getElementById("read").style.display = "block";
	}).fail(function() {
		alert("ERROR");
	});
}

function goBoard() {
	window.location.reload(true);
}
</script>