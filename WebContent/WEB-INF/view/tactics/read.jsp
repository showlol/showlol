<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

글읽기
<div>${tactics.title }</div><br/>
<div>${tactics.writer }</div><br/>
<div>${tactics.content1 }</div><br/>
<hr/>
<c:if test="${nick!=null }">
	<form action="/tactics/reply">
	<input type="hidden" name="nick" value="${nick }">${nick }<br/>
	<input type="hidden" name="parentNum" value="${tactics.num }">
	<textarea rows="4" name="area"></textarea><br/>
	<input type="submit" value="입력 완료"/>
	</form>
</c:if>
<c:forEach var="r" items="${readReply }">
	<div>
		<b>작성자:${r.WRITER }</b> (작성일:${r.WRITEDATE }) <input type="button" value="댓글 남기기" style="font-size:9;" id="rep"/><br/>
		${r.CONTENT }
		<hr/>
	</div>
</c:forEach>
<script>
	$(document).ready(function() {
		$("input").click(function() {
			console.log($(this));
			rep($(this));
		});
	});
	var replyBox = document.createElement("div");
		replyBox.innerHTML = "<textarea rows='4'></textarea> <input type='button' value='작성 완료' style='font-size:11;' id='repbt'/>";
	function rep(button) {
		button.parent().append(replyBox);
	};
	document.getElementById("repbt").addEventListener("click", function() {
		bt2();
	});
	function bt2() {
		$.ajax({
			type : "get",
			url : "/tactics/follow"
		});
	};
</script>