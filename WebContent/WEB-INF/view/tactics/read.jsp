<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

글읽기 <input type="button" value="수정하기" id="update"/><input type="button" value="삭제" id="delete"/>
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
		<b>작성자:${r.WRITER }</b> (작성일:${r.WRITEDATE }) <input type="button" value="댓글 남기기" style="font-size:9;" id="${r.NUM }"/><br/>
		${r.CONTENT }
		<hr/>
	<c:forEach var="f" items="${followList }">
	<div>
		<c:if test="${f.PARENTNUM==r.NUM }">
		└<b>작성자:${f.WRITER }</b> (작성일:${f.WRITEDATE })<br/>
		${f.CONTENT }
		<hr/>
		</c:if>
	</div>
</c:forEach>
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
		replyBox.innerHTML = "<textarea rows='4' id='follow'></textarea> <input type='button' value='작성 완료' style='font-size:11;' id='repbt'/>";
	function rep(button) {
		button.parent().append(replyBox);
		document.getElementById("repbt").addEventListener("click", function() {
			alert(follow.value);
			
			$.ajax({
				method : "get",
				url : "/tactics/follow?writer=${nick}&follow="+follow.value+"&parentNum="+button.attr("id")
			});
		});
	};
	document.getElementById("update").addEventListener("click", function() {
		update();
	});
	function update() {
		
	};
	document.getElementById("delete").addEventListener("click", function() {
		deletedata();
	});
	function deletedata() {
		
	};
</script>