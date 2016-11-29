<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<div style="border:1px solid lightgray; padding: 5% ; background-color:#FFFFFF">
<br />
<div align="right">
	<c:if test="${nick!=null }">
		<input type="submit" value="���ƿ�" onclick="likein(${num })"
			class="btn-sm btn-primary" /> 
		<c:if test="${nick==cdata.writer}">
			<span id="btnGroup">
				| <button type="button" id="update" class="btn-sm btn-primary">�����ϱ�</button>
				|
				<button type="button" id="delete" class="btn-sm btn-primary">�ۻ���</button>
			</span>
		</c:if>
	</c:if>
</div>
	<b>����</b>
	<div>${cdata.title }</div>
	<br />
	<b>�ۼ���</b>
	<div>${cdata.writer }</div>
	<br />
	<b>����</b>
	<br />
	<div style="font-family: ���� ���; font-size: 11pt;">${cdata.memo }</div>
	<br />


<form action="/community/return">
	<input type="submit" value="���" class="btn-sm btn-primary" />
</form>

<c:if test="${nick!=null }">
	<form action="/community/reply">
		<input type="hidden" name="nick" value="${nick }">${nick }<br />
		<input type="hidden" name="parentNum" value="${cdata.num }">
		<textarea rows="4" name="area"></textarea>
		<br /> <input type="submit" value="��� �ۼ�" class="btn-sm btn-primary" />
	</form>
</c:if>
<c:forEach var="r" items="${readReply }">
	<!-- ��� -->
	<div>
		<b>�ۼ���:${r.WRITER }</b> (�ۼ���:${r.WRITEDATE }) <input type="button"
			kind="reFollow" value="��� �����" style="font-size: 9;" id="${r.NUM }"
			class="btn-sm btn-primary" />
		<c:if test="${r.WRITER==nick }">
			<input type="button" class="btn-sm btn-primary" kind="upReply"
				value="����" id="${r.NUM }" style="font-size: 9;" />
			<input type="button" class="btn-sm btn-primary" value="����"
				kind="delReply" id="${r.NUM }" style="font-size: 9;" />
		</c:if>
		<br />
		<div id="cotent_${r.NUM }">${r.CONTENT }</div>
		<hr />
	</div>
	<c:forEach var="f" items="${followList }">
		<!-- ���� -->
		<div>
			<c:if test="${f.PARENTNUM==r.NUM }">
				<img src="/image/review2.png" />
				<b>�ۼ���:${f.WRITER }</b> (�ۼ���:${f.WRITEDATE }) 
				 <c:if test="${f.WRITER==nick }">
					<input type="button" class="btn-sm btn-primary" kind='upReply2'
						value="����" id="${f.NUM }" style="font-size: 9;" />
					<input type="button" value="����" class="btn-sm btn-primary"
						kind="delReply2" id="${f.NUM }" style="font-size: 9;" />
				</c:if>
				<br />
				<div id="cotent_${f.NUM }">${f.CONTENT }</div>
				<hr />
			</c:if>
		</div>
	</c:forEach>
</c:forEach>
</div>
<script>
	function likein(num) {
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/community/reviewg?num="+num, true);
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
			if($(this).val()=="��� �����"){
				rep($(this));	
			}			
		});

		//��� ����
		$("input[kind=upReply]").click(function() {
			console.log($(this).attr("id"));
			updateReply($(this), $(this).attr("id"));
		});
		//��� ����
		$("input[kind=delReply]").click(function() {
			console.log($(this).attr("id"));
			deleteReply($(this).attr("id"));
		});
		//���� ����
		$("input[kind=upReply2]").click(function() {
			console.log($(this).attr("id"));
			updateReply2($(this), $(this).attr("id"));
		});
		//���� ����
		$("input[kind=delReply2]").click(function() {
			console.log($(this).attr("id"));
			deleteReply2($(this).attr("id"));
		});
	});
	var replyBox = document.createElement("div");
		replyBox.innerHTML = "<textarea rows='4' id='follow'></textarea> <input type='button' value='�ۼ� �Ϸ�' class='btn-sm btn-primary' style='font-size:11;' id='repbt'/>";
	
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
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='�����ϱ�' class='btn-sm btn-primary' style='font-size:11;' id='upbt'/>";
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
		replyBox.innerHTML = "<textarea rows='4' id='content'>"+tar+"</textarea> <input type='button' value='�����ϱ�' class='btn-sm btn-primary' style='font-size:11;' id='upbt'/>";
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
	
	$("#btnGroup").children().click(function(e){
		if(e.target.getAttribute("id")=="delete"){
			$.ajax({
				url : "/community/delete/${cdata.num}",
				async : false
			}).done(function(r){
				if(r==true){
					alert("�Խñ� ������ �Ϸ�Ǿ����ϴ�.");
					location.href="/community/review2";						
				}else{
					alert("�Խñ��� �������� �ʾҽ��ϴ�.");
				}
			}).fail(function(r){
				alert(r.data);
			});					
		}			
		if(e.target.getAttribute("id")=="update"){
			location.replace("/community/update/${cdata.num}");				
		}				
	});	

	
	
</script>