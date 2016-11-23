<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

글읽기
<input type="button" value="수정하기" id="update" />
<input type="button" value="삭제" id="delete" />
<div>${tactics.title }</div>
<br />
<div>${tactics.writer }</div>
<br />
<div>${tactics.content1 }</div>
<br />
<hr />
<c:if test="${nick!=null }">
	<form action="/tactics/reply">
		<input type="hidden" name="nick" value="${nick }">${nick }<br />
		<input type="hidden" name="parentNum" value="${tactics.num }">
		<textarea rows="4" name="area"></textarea>
		<br /> <input type="submit" value="입력 완료" />
	</form>
</c:if>
<c:forEach var="r" items="${readReply }">
	<!-- 댓글 -->
	<div>
		<b>작성자:${r.WRITER }</b> (작성일:${r.WRITEDATE })
		<c:if test="${nick!=null }">
		<input type="button" class="reFollow" value="댓글 남기기" style="font-size: 9;" id="${r.NUM }" />
		</c:if>
		<c:if test="${r.WRITER==nick }">
			<input type="button" class="upReply" value="수정" id="${r.NUM }" style="font-size: 9;" /> 
			<input type="button" value="삭제" class="delReply" id="${r.NUM }" style="font-size: 9;" />
		</c:if><br />
		<div id="cotent_${r.NUM }">${r.CONTENT }</div>
		<hr />
	</div>
	<c:forEach var="f" items="${followList }">
		<!-- 대댓글 -->
		<div>
			<c:if test="${f.PARENTNUM==r.NUM }">
				└<b>작성자:${f.WRITER }</b> (작성일:${f.WRITEDATE }) 
				 <c:if test="${f.WRITER==nick }">
				 	<input type="button" class="upReply2" value="수정" id="${f.NUM }" style="font-size: 9;" />
				 	<input type="button" value="삭제" class="delReply2" id="${f.NUM }" style="font-size: 9;" />
				 </c:if><br />
				<div id="cotent_${f.NUM }">${f.CONTENT }</div>
				<hr />
			</c:if>
		</div>
	</c:forEach>
</c:forEach>
<script>
	$(document).ready(function() {
		$("input").click(function() {
			console.log($(this));			
			$("input.reFollow").click(function() {
				console.log($(this));
				rep($(this));
			});		
		});
		//댓글 수정
		$("input.upReply").click(function() {
			console.log($(this).attr("id"));
			updateReply($(this), $(this).attr("id"));
		});
		//댓글 삭제
		$("input.delReply").click(function() {
			console.log($(this).attr("id"));
			deleteReply($(this).attr("id"));
		});
		//대댓글 수정
		$("input.upReply2").click(function() {
			console.log($(this).attr("id"));
			updateReply2($(this), $(this).attr("id"));
		});
		//대댓글 삭제
		$("input.delReply2").click(function() {
			console.log($(this).attr("id"));
			deleteReply2($(this).attr("id"));
		});
	});
	var replyBox = document.createElement("div");
		replyBox.innerHTML = "<textarea rows='4' id='follow'></textarea> <input type='button' value='작성 완료' style='font-size:11;' id='repbt'/>";
	
	//대댓글
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
	
	//글 수정
	document.getElementById("update").addEventListener("click", function() {
		update();
	});
	
	//글 삭제
	document.getElementById("delete").addEventListener("click", function() {
		deletedata();
	});
	
	//댓글 수정
	function updateReply(up, id) {
		up.parent().append(replyBox);
		var tar = document.getElementById("cotent_"+id).innerHTML;
		//window.alert(tar);
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='수정하기' style='font-size:11;' id='upbt'/>";
		document.getElementById("upbt").addEventListener("click", function() {
			alert(content.value);
			$.ajax({
				method : "get",
				url : "/tactics/upReply?content="+content.value+"&num="+up.attr("id")
			});
			location.href="";
		});
	};
	
	//댓글 삭제
	function deleteReply(del) {
		$.ajax({
			method : "get",
			url : "/tactics/delReply?num="+del
		});
		location.href="";
	};
	
	//대댓글 수정
	function updateReply2(up, id) {
		up.parent().append(replyBox);
		var tar = document.getElementById("cotent_"+id).innerHTML;
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='수정하기' style='font-size:11;' id='upbt'/>";
		document.getElementById("upbt").addEventListener("click", function() {
			$.ajax({
				method : "get",
				url : "/tactics/upReply2?content="+content.value+"&num="+up.attr("id")
			});
			location.href="";
		});
	};
	
	//대댓글 삭제
	function deleteReply2(del) {
		$.ajax({
			method : "get",
			url : "/tactics/delReply2?num="+del
		});
		location.href="";
	};
</script>