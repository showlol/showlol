<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="skillTree" style="height: 150px; width: auto;"></div>
<div style='clear: left;'></div>
<div id="skillContent" class="tacticsContent" >${tactics.skillContent }</div>
<script>
	var champKey="${champData.key }";
	var skillBuild = "${tactics.skillBuild }".split("#");
</script>			
<script src='/js/tactics/read/skillRead.js'></script>			
