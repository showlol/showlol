<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>			
		<ul class="mastery_title">
			<li>흉포 : <b id="ferocity" >0</b>
			<li>교활 : <b id="cunning" >0</b>
			<li>결의 : <b id="resolve" >0</b>
		</ul>
		<span class="clearfix"><br></span>
		<div style='background-image: url("/image/masteryboard.png")' >
			<ul class="mastery_ul" id="mastery_ul"></ul>
		</div>
		<div id='initMasteryWrap' class='clearBtnWrap' ></div>
		<textarea name="masteryContent" id="masteryContent">${tactics.masteryContent }</textarea>		
		<script>
			CKEDITOR.replace('masteryContent');
		</script>
</div>
<script src='/js/mastery/masteryDIV.js'></script>
<script src='/js/mastery/masteryMod.js'></script>
<script>
	$("ferocity").html(m0);
	$("cunning").html(m1);
	$("resolve").html(m2);
</script>



