<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Ŀ�´�Ƽ �Խ���</h2>
<table class="table table-hover info">

	<thead>
		<tr>
			<th>�۹�ȣ<th>����<th>�ۼ���<th>��õ��<th>�ۼ���
		</tr>
	</thead>
		<tbody>
			<c:forEach var="t" items="${size }" >
			<tr class="info">
				<td id="num">${t.num }<td>${t.title }<td>${t.writer }<td><fmt:formatNumber value ="${t.good }" /><td><fmt:formatDate value="${t.writedate }" pattern="yy/MM/dd hh:mm"/>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
<c:forEach var="i" begin="1" end="${total}">
	<c:choose>
		<c:when test="${current == i }">
		</c:when>
	<c:otherwise>
	<a href = "/community/review2?p=${i }">${i}</a>
	</c:otherwise>
	</c:choose>
</c:forEach>


<form action="/community/writepage">
	<input type="submit" value="�Խñ��ۼ�"/>
</form>

<script>
	$("tbody").click(function(e){
		console.log($(e.target).siblings("#num").html());
		location.href = "/community/read/" + $(e.target).siblings("#num").html();
	});

	
</script>

