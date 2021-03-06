<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<link href="/css/tactics.css" rel="stylesheet">
	<script>var champKey = "${champData.key}";
		console.log("테스트:"+champKey);
	</script>
</head>
<div style=' margin: 0 auto; padding: 3%; width: 720px; overflow: auto; white-space: nowrap;'>

	<h3 style="font-family: 'Nanum Gothic', sans-serif;">${tactics.champ } 공략글 </h3>
	<div style="float: left;">
		<img class="img-rounded" src="http://ddragon.leagueoflegends.com/cdn/6.22.1/img/champion/${champData.image1}" >
	</div>
	
	<div style="float:left; width: 300px; height: 115px; background-color: #E7E3F0;
		border-radius: 3px; padding: 10px; margin: 0 8px; white-space: normal;">
		<b style="display: inline; width: 290px; text-align:left;  inhfont-family: 'Nanum Gothic', sans-serif;" >${tactics.title }</b><br/>
		<div align='right'>
		<span style=" font-family: 'Nanum Gothic', sans-serif;">작성자 : ${tactics.writer }</span><br/>
		<span style="font-family: 'Nanum Gothic', sans-serif;">
			<fmt:formatDate value="${tactics.writeDate }" pattern="MM/dd " />
		</span>
		</div>	
	</div>
	<br/>
	<div class='well' style='clear: left; width: 650px; margin: 10px 0;'>
		<ul class="nav nav-tabs">
				<li class="active"><a a data-toggle="tab" href="#mastery" style="font-family: 'Nanum Gothic', sans-serif;">특성</a>
				<li><a href="#rune" style="font-family: 'Nanum Gothic', sans-serif;">룬</a>
				<li><a href="#skill" style="font-family: 'Nanum Gothic', sans-serif;">스킬</a>
				<li><a href="#items" style="font-family: 'Nanum Gothic', sans-serif;">아이템</a>
			</ul>
			<div class="tab-content">	
				<div id="mastery" class="tab-pane fade in active ">
					<c:import url="tactics/read/readMastery.jsp"></c:import>
				</div>
				<div id="rune" class="tab-pane fade in">
					<c:import url="tactics/read/readRune.jsp"></c:import>			
				</div>
				<div id="skill" class="tab-pane fade in">
					<c:import url="tactics/read/readSkills.jsp"></c:import>			
				</div>
				<div id="items" class="tab-pane fade in">
					<c:import url="tactics/read/readItems.jsp"></c:import>			
				</div>
			</div>
		
		<br/>
		<hr style="clear: left;">
	
		<div style="clear: left; width: 580; " align='center' >
			<button type='button' id='recommend-good'><img src='/image/good-orgin.png' width='30px' height='30px'><br/>
				<span>${tactics.good }</span>
			</button>
			<button type='button' id='recommend-bad'><img src='/image/bad.png' width='30px' height='30px'><br/>
				<span>${tactics.bad }</span>
			</button>
			<br/>		
		</div>
	</div>
	<c:if test="${tactics.writer==nick }">
		<div id="btnGroup" align="right" style='margin: 3%;'>
			<button id = "tacticsDel" type="button" class='btn btn-success' >삭제</button>
			<button id = "tacticsMod" type="button" class='btn btn-success' >수정하기</button>
		</div>
	</c:if>	
	
<br />
<hr style="clear: right;">

<c:if test="${nick!=null }">
	<form action="/tactics/reply">
		<input type="hidden" name="nick" value="${nick }">${nick }<br />
		<input type="hidden" name="parentNum" value="${tactics.num }">
		<textarea rows="4" name="area" style="resize: none;"></textarea>
		<br /> <input type="submit" value="입력 완료" class="btn btn-default"/>
	</form>
</c:if>
<c:forEach var="r" items="${readReply }">
	<!-- 댓글 -->
	<div>
		<b>작성자:${r.WRITER }</b> (작성일:${r.WRITEDATE })
		<c:if test="${nick!=null }">
		<input type="button" name="reFollow" value="댓글 남기기" style="font-size: 9;" id="${r.NUM }" class="btn btn-default"/>
		</c:if>
		<c:if test="${r.WRITER==nick }">
			<input type="button" name="upReply" value="수정" id="${r.NUM }" style="font-size: 9;" class="btn btn-default" /> 
			<input type="button" value="삭제" name="delReply" id="${r.NUM }" style="font-size: 9;" class="btn btn-default"/>
		</c:if><br />
		<div id="cotent_${r.NUM }">${r.CONTENT }</div>
		<hr />
	</div>
	<c:forEach var="f" items="${followList }">
		<!-- 대댓글 -->
		<div>
			<c:if test="${f.PARENTNUM==r.NUM }">
				<img src="/image/review2.png"/><b>작성자:${f.WRITER }</b> (작성일:${f.WRITEDATE }) 
				 <c:if test="${f.WRITER==nick }">
				 	<input type="button" name="upReply2" value="수정" id="${f.NUM }" style="font-size: 9;" class="btn btn-default" />
				 	<input type="button" value="삭제" name="delReply2" id="${f.NUM }" style="font-size: 9;" class="btn btn-default"/>
				 </c:if><br />
				<div id="cotent_${f.NUM }">${f.CONTENT }</div>
				<hr />
			</c:if>
		</div>
	</c:forEach>
</c:forEach>
</div>
<!-- Modal -->
<!-- <div id="confirmModal" class="modal fade" role="dialog"> -->
<!--   <div class="modal-dialog modal-sm"> -->

<!--     Modal content -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button>        -->
<!--       </div> -->
<!--       <div class="modal-body">        		 -->
<!-- 		<button class="btn" id="login" ></button> -->
<!-- 		<button class="btn" value="로그인" id="login" ></button> -->
<!--       </div>       -->
<!--     </div> -->

<!--   </div> -->
<!-- </div> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>	
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		//공략글 삭제 수정
		$("#btnGroup").children().click(function(e){
			if(e.target.getAttribute("id")=="tacticsDel"){
				$.ajax({
					url : "/tactics/tacticsDel/${tactics.num}",
					async : false
				}).done(function(r){
					if(r==true){
						alert("공략 삭제가 완료되었습니다.");
						location.href="/tactics/";						
					}else{
						alert("글이 삭제되지 않았습니다.");
					}
				}).fail(function(r){
					alert(r.data);
				});					
			}			
			if(e.target.getAttribute("id")=="tacticsMod"){
				location.replace("/tactics/modify/");				
			}
		});		
		//추천 버튼 이벤트
		$("[id^='recommend'").click(function(){
			var sel = "bad";
			if($(this).attr('id').includes("good")){
				sel = "good";
			}
			var span = $(this).children("span");
			$.ajax({
				url : "/tactics/recommend/${tactics.num}/"+sel,
				async : false
			}).done(function(r){
				span.html(span.html()/1+1);				
			});	
		});
		
				
		$("input[name='reFollow']").click(function() {
				console.log($(this));
				rep($(this));					
		});
		//댓글 수정
		if(${nick!=null }) {
			$("input[name='upReply']").click(function() {
				console.log($(this).attr("id"));
				updateReply($(this), $(this).attr("id"));
			});
		};
		//댓글 삭제
		if(${nick!=null }) {
			$("input[name='delReply']").click(function() {
				console.log($(this).attr("id"));
				deleteReply($(this).attr("id"));
			});
		};
		//대댓글 수정
		if(${nick!=null }) {
			$("input[name='upReply2']").click(function() {
				console.log($(this).attr("id"));
				updateReply2($(this), $(this).attr("id"));
			});
		};
		//대댓글 삭제

		if(${nick!=null }) {
			$("input[name='delReply2']").click(function() {
				console.log($(this).attr("id"));
				deleteReply2($(this).attr("id"));
			});
		};
	});
	
	function tacticsModify(){
		$.ajax("/js/mastery/masteryMod.js");
		$.get("/tactics/rune", function(r){
			var div = "<div id='rune' class='tab-pane fade in'>"+r+"</div>";
			$("#rune").replaceWith(div);
		});		

		$("#btnGroup").replaceWith("<button id='tacticsModBtn' type='submit' class='btn btn-primary'>"+
				"등록하기</button>");		
	}	
	
	var replyBox = document.createElement("div");
		replyBox.innerHTML = "<textarea rows='4' id='follow' style='resize: none; '></textarea><br/>"
			+"<input type='button' value='작성 완료' class='btn btn-default' style='font-size:11; margin: 5px; ' id='repbt'/>";
	
	//대댓글
	function rep(button) {
		button.parent().append(replyBox);
		document.getElementById("repbt").addEventListener("click", function() {
			alert(follow.value);
			
			$.ajax({
				method : "get",
				url : "/tactics/follow?writer=${nick}&follow="+follow.value+"&parentNum="+button.attr("id")
			}).done(function(){
				location.reload();
			});
		});
	};
	


	//댓글 수정
	function updateReply(up, id) {
		up.parent().append(replyBox);
		var tar = document.getElementById("cotent_"+id).innerHTML;
		//window.alert(tar);
		replyBox.innerHTML = "<textarea rows='4' id='content' style='resize: none;'>"+tar+"</textarea> <input type='button' value='수정하기' style='font-size:11;' id='upbt'/>";
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
		replyBox.innerHTML = "<textarea rows='4' id='content' style='resize: none;'>"+tar+"</textarea> <input type='button' value='수정하기' style='font-size:11;' id='upbt'/>";
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