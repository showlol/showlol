<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	a{
		font-family: 'Oswald', sans-serif;
	}
</style>
<div style="height:70px; vertical-align: middle; ">
	<a>|</a>
	<a href="#top"><strong style="color: white;">TOP</strong></a>
	<a>|</a>
	<a href="/"><strong style="color: white;">SHOWLOL Co.</strong></a>
	<a>|</a>
	<a onclick="showMemo()" style="cursor:pointer;text-decoration:none;"><strong style="color: white;">MESSAGE</strong></a>
	<a>|</a>
</div>
<script>
function showMemo() {
	var url = "/memo/list";
	window.open(url, "", "width=550,height=450");
}
</script>