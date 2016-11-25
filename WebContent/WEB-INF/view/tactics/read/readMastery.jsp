<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="mastery_ul" id="mastery_ul"></ul>
<div style="clear: left;"></div>
<p>${tactics.masteryContent }</p>
<script src='/js/masteryDIV.js'></script>
<script>

	var masteryData=[];
	$("readMaster.jsp").ready(function(){		
		masteryData = "${tactics.masteryData }".split("#");		
		console.log(masteryData);
		masteryData.forEach(function(data, num){
			$(".attrBox[id="+num+"]").children("#point").html(data);
		});
	});
</script>