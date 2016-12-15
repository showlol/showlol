<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<table style='height: 200px;'>
	<tr>
		<form id='1' method='post' pass='' >
			<td><input type='submit'  value='안녕'>
			<td><input id='a' type='text' name='text1'>
			<td><input type='text' name='text2' >	
		</form>		
	</tr>
	<tr>
		<form id='2' >
			<td><input type='submit'  value='안녕'>
			<td><input type='text' name='text1'>
			<td><input type='text' name='text2'>	
		</form>			
	</tr>
</table>

<script>
// 	var data={
// 			"date" : "",
// 			"name" : "",
// 	}
// 	$("input[type='button']").click(function(e){
// 		var input = $(this).parents("tr").find("input");
// 		for(i=1; i<input.length; i++){
// 			data[i]=input[i].value;
// 		}
// 		console.log(data);
// 	});	



// 	}	
	console.log($("table").css("height"));
	
	$("form").submit(function(e){
		console.log(e);
		var data = $(this).serializeArray();
		$.ajax({
			type: "post",
			url : "/etc",
			data : data			
		});
		
		return false;
	});
	
</script>



