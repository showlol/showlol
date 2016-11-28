<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

���б�
<c:if test="${nick!=null }">
	<input type="submit" value="���ƿ�"  onclick="likein(${num })"  class="btn btn-default"  /> |
		<c:if test="${nick==cdata.writer}">
			<input type="button" value="�����ϱ�" id="update" class="btn btn-default"/> |
			<input type="submit" value="�ۻ���" onclick="deleten(${num })" class="btn btn-default"/> |
		</c:if>
</c:if>
	<br />
	<b>����</b><div>${cdata.title }</div>
	<br />
	<b>�ۼ���</b><div>${cdata.writer }</div>
	<br />
	<div>
		<pre style="font-family: ���� ���; font-size: 11pt;">${cdata.memo }</pre>
	</div>
	<br />

	
	<form action="/community/return" >
		<input type="submit" value="���" class="btn btn-default"/>
	</form>
	
	<c:if test="${nick!=null }">
	<form action="/community/reply">
		<input type="hidden" name="nick" value="${nick }">${nick }<br />
		<input type="hidden" name="parentNum" value="${cdata.num }">
		<textarea rows="4" name="area"></textarea>
		<br /> <input type="submit" value="��� �ۼ�" class="btn btn-default"/>
	</form>
</c:if>
<c:forEach var="r" items="${readReply }">
	<!-- ��� -->
	<div>
		<b>�ۼ���:${r.WRITER }</b> (�ۼ���:${r.WRITEDATE }) <input type="button" name="reFollow" value="��� �����" style="font-size: 9;" id="${r.NUM }" class="btn btn-default"/>
		<c:if test="${r.WRITER==nick }">
			<input type="button" name="upReply" value="����" id="${r.NUM }" style="font-size: 9;" class="btn btn-default"/> 
			<input type="button" value="����" name="delReply" id="${r.NUM }" style="font-size: 9;" class="btn btn-default"/>
		</c:if><br />
		<div id="cotent_${r.NUM }">${r.CONTENT }</div>
		<hr />
	</div>
	<c:forEach var="f" items="${followList }">
		<!-- ���� -->
		<div>
			<c:if test="${f.PARENTNUM==r.NUM }">
				��<b>�ۼ���:${f.WRITER }</b> (�ۼ���:${f.WRITEDATE }) 
				 <c:if test="${f.WRITER==nick }">
				 	<input type="button" name="upReply2" value="����" id="${f.NUM }" style="font-size: 9;" class="btn btn-default"/>
				 	<input type="button" value="����" name="delReply2" id="${f.NUM }" style="font-size: 9;" class="btn btn-default"/>
				 </c:if><br />
				<div id="cotent_${f.NUM }">${f.CONTENT }</div>
				<hr />
			</c:if>
		</div>
	</c:forEach>
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
	
	document.getElementById("update").addEventListener("click", function() {
		update();
	});
	
	$(document).ready(function() {
		$("input").click(function() {
			console.log($(this));			
			$("input.reFollow").click(function() {
				console.log($(this));
				rep($(this));
			});		
		});
		//��� ����
		$("input.upReply").click(function() {
			console.log($(this).attr("id"));
			updateReply($(this), $(this).attr("id"));
		});
		//��� ����
		$("input.delReply").click(function() {
			console.log($(this).attr("id"));
			deleteReply($(this).attr("id"));
		});
		//���� ����
		$("input.upReply2").click(function() {
			console.log($(this).attr("id"));
			updateReply2($(this), $(this).attr("id"));
		});
		//���� ����
		$("input.delReply2").click(function() {
			console.log($(this).attr("id"));
			deleteReply2($(this).attr("id"));
		});
	});
	var replyBox = document.createElement("div");
		replyBox.innerHTML = "<textarea rows='4' id='follow'></textarea> <input type='button' value='�ۼ� �Ϸ�' style='font-size:11;' id='repbt'/>";
	
	//����
	function rep(button) {
		button.parent().append(replyBox);
		document.getElementById("repbt").addEventListener("click", function() {
			alert(follow.value);
			
			$.ajax({
				method : "get",
				url : "/community/follow?writer=${nick}&follow="+follow.value+"&parentNum="+button.attr("id")
			});
		});
	};
	//��� ����
	function updateReply(up, id) {
		up.parent().append(replyBox);
		var tar = document.getElementById("cotent_"+id).innerHTML;
		//window.alert(tar);
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='�����ϱ�' style='font-size:11;' id='upbt'/>";
		document.getElementById("upbt").addEventListener("click", function() {
			alert(content.value);
			$.ajax({
				method : "get",
				url : "/community/upReply?content="+content.value+"&num="+up.attr("id")
			});
			location.href="";
		});
	};
	
	//��� ����
	function deleteReply(del) {
		$.ajax({
			method : "get",
			url : "/community/delReply?num="+del
		});
		location.href="";
	};
	
	//���� ����
	function updateReply2(up, id) {
		up.parent().append(replyBox);
		var tar = document.getElementById("cotent_"+id).innerHTML;
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='�����ϱ�' style='font-size:11;' id='upbt'/>";
		document.getElementById("upbt").addEventListener("click", function() {
			$.ajax({
				method : "get",
				url : "/community/upReply2?content="+content.value+"&num="+up.attr("id")
			});
			location.href="";
		});
	};
	
	//���� ����
	function deleteReply2(del) {
		$.ajax({
			method : "get",
			url : "/community/delReply2?num="+del
		});
		location.href="";
	};
	
</script>