<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<head>
	<link href="/css/main.css" rel="stylesheet" >
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Dynamic Tabs with jQuery</h2>
  <p>Click on the Tabs to display the active and previous tab.</p>
  <ul class="nav nav-tabs">
    <li class="active"><a href="#home">Home</a></li>
    <li><a href="#menu1">Menu 1</a></li>
    <li><a href="#menu2">Menu 2</a></li>
    <li><a href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
     
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" name='a' class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" name='b' class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" name='c' class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
    <hr>
    <p class="act"><b>Active Tab</b>: <span></span></p>
    <p class="prev"><b>Previous Tab</b>: <span></span></p>
</div>
	<textarea rows="10" cols="100" disabled="disabled" style="resize: none" >ggagaga</textarea>
	
<!-- <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<hr><br/><br/>
<div id="da1"></div>
<hr/>
<div id="datepicker"></div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

var t1 = new Date();
var t2;
function tt(){
	t2 = new Date("2010/12/10");
	console.log(t2);
}

console.log(t1);
setTimeout(tt, 3000 );
console.log(t2);
var time = t1.getDate();
// t2 = t2.getDate();
var b = t1==t2? true : false;
console.log(time);

var skillTree={
		level : 0,
		0 : 3,
		1 : 4,
		2 : 0,
		3 : 0,
};
console.log(skillTree[0]);
console.log("크기:"+skillTree.hasOwnProperty("aa"));


// $("[name]").each(function(i){
// 	console.log(this);
// });
// var now = new Date(112134231);
// console.log(now.getTimezoneOffset());
// console.log(now);
// console.log(now.getUTCDate());
// console.log(now.toDateString());
// console.log(now.toTimeString());
// console.log(now.toLocaleDateString());
// console.log(now.toLocaleString());
// console.log(now.getDate());
</script>
	
</body>
</html>


