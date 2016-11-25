<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<div style="text-align: center; padding-top: 40px;">
	<form action="/summoner/index" method="post" style="display:inline;" id="search">
		<input type="text" name="userName" value="${sname }" style="font-size: 24;" list="hist" required="required" id="tt"/>
		<datalist id="hist">
			<c:set var="arr" value="${fn:split(hist, ',') }"/>
			<c:forEach var="h" items="${arr }">
				<option class="item" value="${h }" onchange="goSummoner()"/>
			</c:forEach>
		</datalist>
		<input type="submit" value="검색" style="font-size: 24;"/>
	</form>
</div>

<script>
	$("#tt").on("input", function(){
		$(".item").each(function(){
			if($(this).val() == $("#tt").val()) {
				$("#search").submit();
			}
		});
	});
	
	function goSummoner() {
		alert("!!!!");
		//location.href="/summoner/index?userName="+name;
	}
</script>

