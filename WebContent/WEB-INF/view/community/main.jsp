<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	th{
	 font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<h2 style="font-family: 'Nanum Gothic', sans-serif;">커뮤니티 게시판</h2>
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
				<td><a href="/community/read/${t.num }" style="text-decoration:none; font-family: 'Nanum Gothic', sans-serif;">${t.title }</a></td>
				<td>
					<div class="dropdown">
						<button class="btn btn-info btn-xs dropdown-toggle" id="menu1"
							type="button" data-toggle="dropdown" style="color: white; font-family: 'Nanum Gothic', sans-serif;">
							${t.writer } 
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
							onclick="showView('${t.writer}')"	 style="font-family: 'Nanum Gothic', sans-serif;">쪽지 보내기</a></li>
						</ul>
					</div>
				</td>
				<td><img src="/image/like.png"/><fmt:formatNumber value="${t.good }" />
				<td><fmt:formatDate value="${t.writedate }"
						pattern="yy/MM/dd hh:mm" />
				<td style="font-family: 'Nanum Gothic', sans-serif;">${t.clicks}
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
		style="border-color: white; font-family: 'Nanum Gothic', sans-serif;">게시글 작성</button>
</form>

<!-- 검색기능 -->
<div align="right">
	<form  action="/community/searchst">
		<div class="form-group form-inline">
			<select  class="form-control" name="ctg">
				<option value="title" style="font-family: 'Nanum Gothic', sans-serif;">제목</option>
				<option value="writer" style="font-family: 'Nanum Gothic', sans-serif;">작성자</option>
				<option value="titlememo" style="font-family: 'Nanum Gothic', sans-serif;">제목+내용</option>
			</select> 
			<input type="text"  class="form-control" placeholder="검색어" name="topic"/>
			<button type="submit" class="btn btn-default" style="border-color: white; font-family: 'Nanum Gothic', sans-serif;">검색</button>
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
	
	//게시글작성시 로그인여부		
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
	



</script>

