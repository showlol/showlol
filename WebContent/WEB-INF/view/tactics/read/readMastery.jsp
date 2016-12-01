<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul id="mastery_title" class="mastery_title">
		<li>흉포 : <b id="ferocity" name="m0">0</b>
		<li>결의 : <b id="cunning" name="m1">0</b>
		<li>교활 : <b id="resolve" name="m2">0</b>
</ul>
	<span class="clearfix"><br></span>
	<ul class="mastery_ul" id="mastery_ul" style='display: inline-block; ' ></ul>
<div style="clear: left;"></div>
<div id="masteryContent" class="tacticsContent" >${tactics.masteryContent }</div>
<script src='/js/mastery/masteryDIV.js'></script>
<script>
	var masteryData=[];
	$("readMaster.jsp").ready(function(){		
		masteryData = "${tactics.masteryData }".split("#");		
		var masteryClass=[0, 0, 0];
		for(i=0; i<masteryData.length-1; i++){
			$(".attrBox[id="+(i+1)+"]").children("#point").html(masteryData[i]);
			masteryClass[Math.floor(i/15)]+=masteryData[i]/1;
		}		
		$("#mastery_title").children("li").children("b").each(function(i){
			this.innerHTML=masteryClass[i];
		});
	});
</script>

