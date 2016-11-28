<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div style="text-align: center; padding-top: 40px;" class="form-group form-inline">
	<form action="/summoner/index" method="post" style="display:inline;">	
		<input type="text" name="userName" value="${sname }" style="font-size: 24;"placeholder="소환사명" class="form-control" />
		<input type="submit" value="검색" style="font-size: 20;"class="btn btn-default"  />
	</form>
</div>

