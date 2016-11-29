<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2>커뮤니티 게시판</h2>
<!-- 글 리스트 기능 -->
<table class="table table-hover info">
	<thead>
		<tr>
			<th>글번호
			<th>제목
			<th>작성자
			<th>추천수
			<th>작성일
			<th>조회수
		</tr>
	</thead>
	<tbody>
		<c:forEach var="t" items="${size }">
			<tr class="info">
				<td id="num">${t.num }</td>
				<td><a href="/community/read/${t.num }" style="text-decoration:none">${t.title }</td>
				<td>
					<div class="dropdown">
						<button class="btn btn-info btn-xs dropdown-toggle" id="menu1"
							type="button" data-toggle="dropdown" style="color: white">
							${t.writer } 
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
							onclick="showView('${t.writer}')"	>쪽지 보내기</a></li>
						</ul>
					</div>
				</td>
				<td><img src="/image/like.png"/><fmt:formatNumber value="${t.good }" />
				<td><fmt:formatDate value="${t.writedate }"
						pattern="yy/MM/dd hh:mm" />
				<td>${t.clicks}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 페이지 기능 -->
<ul class="pagination">
	<c:forEach var="i" begin="1" end="${total}">
		<c:choose>
			<c:when test="${param.p == i }">
				<li class="disabled"><a  href="/community/review2?p=${i }">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/community/review2?p=${i }">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>
<!-- 게시글 작성기능 -->
<form action="/community/writepage">
	<button type="submit"  id="writing" class="btn btn-default"
		style="border-color: white;">게시글 작성</button>
</form>

<!-- 검색기능 -->
<div align="right">
	<form >
		<div class="form-group form-inline">
			<select  class="form-control">
				<option value="stitle">제목</option>
				<option value="swriter">작성자</option>
				<option value="titlewrite">제목+작성자</option>
			</select> 
			<input type="text"  class="form-control" placeholder="검색어" list="srchrst" name="srch" />
			<button type="submit" class="btn btn-default" style="border-color: white;">검색</button>
		</div>
	</form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	/* $("tbody").click(
			function(e) {
				console.log($(e.target).siblings("#num").html());
				location.href = "/community/read/"
						+ $(e.target).siblings("#num").html();
			}); */
	
	$("#writing").show().click(function(){
		if(${nick==null }){
			alert("로그인이 필요합니다.");
			return false;
		}
			 
		location.href="/tactics/regArticle/"+name+"/"+key;
	});
	
	function showView(writer) {
		var url = "/memo/view/" + writer;
		window.open(url, "", "width=550,height=500");
		
	}
	
	$(document).ready(function(){
	    $(".dropdown-toggle").dropdown();
	});
	/*
	
	document.getElementById("srch").addEventListener("keyup", function(){
		var xhr = new XMLHttpRequest();
		
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		var url = "/community/search?title="+document.getElementById("srch").value;
		xhr.open("get", url, true);
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4 && xhr.status==200) {
			//	var html = xhr.responseText;
			//	document.getElementById("srchrst").innerHTML = html;
				var list = JSON.parse(xhr.responseText);
				var html = "";
				console.log(xhr.responseText);
				console.log(list.length);
				for(var i=0; i<list.length; i++) {
					console.log(list[i].title);
					html+="<option>"+list[i].title+"</option>";
				}
				document.getElementById("srchrst").innerHTML = html;
				console.log(html);
			}
		}
		xhr.send();
		
	});
	
<<<<<<< HEAD
	function readall() {
		location.reload(true);
	};
	
	$(document).ready(function(){
	    $(".dropdown-toggle").dropdown();
	});
	
=======
	*/
</script>

