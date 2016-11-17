<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Ŀ�´�Ƽ �Խ���</h2>
${param.r }
<c:forEach var="t" items="${list }">
	<b>no.${t.num }</b> <b>�ۼ���:</b>${t.writer } <b>����:</b>${t.title } <b>||</b>
	<fmt:formatDate value="${t.writedate }" pattern="yy/MM/dd hh:mm"/>
	(<b>���ƿ� :</b> <fmt:formatNumber value ="${t.good }" /> )
	<input type="button" id="likebutton" onclick="likein(${t.num })" />
	<b>�ۻ���</b><input type="button" id="deleat" onclick="deleten(${t.num })" />
	<br />
	<pre style="font-family: ���� ���; font-size: 11pt;">${t.memo }</pre>
	<hr />
</c:forEach>
<script>
	function likein(num) {
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/community/reviewg?num="+num, true);
		xhr.send();
		readall();
	};
	
	function deleten(num){
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/community/reviewd?num="+num, true);
		xhr.send();
		readall();
	};
	
	function readall() {
		location.reload(true);
	};
</script>

