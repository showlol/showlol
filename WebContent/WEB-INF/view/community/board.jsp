<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>커뮤니티 게시판 글쓰기</h3>

<form action="/community/write">
	  	작성자: <input type="text" name="writer" id="writer" value="aa"><br/>
		제목 : 	 <input type="text" name="title" id="title" size="50" ><br/>
		<br/>
		<textarea cols="100" rows="30" name="memo"></textarea>
		<br/>
		<input type="submit" value="글쓰기"/>
</form>
<!--  
	<c:forEach var="i" begin="1" end="${size }">
		<c:choose>
			<c:when test="${current == i }">
			<b>${i }</b>
			</c:when>
			<c:otherwise>
		 	<a href="/community/write?p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<hr/>
	<c:forEach items="${data }" var="obj">
		<b>${obj.num }</b> 남긴이:${obj.writer }  (좋아요:${obj.good }) | ${obj.writedate }
		<br/>
	<pre style="font-family: 맑은 고딕; font-size: 9pt;">
	${obj.memo }
	</pre>
		<hr/>
	</c:forEach>

<c:if test="${sessionScope.currentId != null}">
	<div style="width: auto;">
		<h4>댓글 남기기</h4>
		<form action="/community/write" method="post">
			<textarea name="memo" rows="3" cols="80"></textarea>
			<input type="submit" value="남기기" height="30" />
		</form>
	</div>
</c:if>

<!-- 
<hr color="black" />
<div>
	<h4>이전 댓글들 (${al.size() })</h4>
	<c:forEach var="t" items="${al }">

		<b>no.${t.num }</b> 
		<my:hide value="${t.writer }" length="3" var="str"/>${str }
		(
		<fmt:formatDate value="${t.writedate }" pattern="YYYY.MM.dd HH:mm:ss" /> ) 
		(
		<c:choose>
			<c:when test="${sessionScope.currentId != null }">
				<c:url var="url" value="">
					<c:param name="target" value="${t.num }" />
				</c:url>
				<a href="${url }">좋아요</a>
			</c:when>
			<c:otherwise>
			좋아요
			</c:otherwise>
		</c:choose>
		: <fmt:formatNumber value="${t.good }" pattern="#,###" /> )
		<br />
		<pre>${t.memo }</pre>
		<hr />
	</c:forEach>
</div>

 -->