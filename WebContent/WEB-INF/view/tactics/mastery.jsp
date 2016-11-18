<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<link href="/css/tactics.css" rel="stylesheet" >
</head>


	<ul class="mastery_title" >
		<li ><div>흉포 : <b id="ferocity" name="m0">0</b></div>
		<li ><div>교활 : <b id="cunning" name="m1">0</b></div>
		<li ><div>결의 : <b id="resolve" name="m2">0</b></div>
	</ul>	
	<span><br></span>
	<ul class="mastery_ul" id="attr"></ul>	
	<input type="button" value="저장" style="clear: left;" >	


<script>
	
	var m_ul = $(".mastery_ul")[0];
	console.log(ul);	
	for(mas=0; mas<3; mas++){
		var div = document.createElement("div");
		div.setAttribute("class", "mastery");
		div.setAttribute("id", "m"+mas); //마스터리 아이디 입력
		var li = document.createElement("li");
		m_ul.append(li);
		li.append(div);
		var ul = document.createElement("ul");
		div.append(ul);
		for(tier=0; tier<6; tier++){			
			var li = document.createElement("li");
			var wrap = document.createElement("div");
			wrap.setAttribute("id", "wrap");
			var div = document.createElement("div");
			
			max = tier%2==0? 2: 3;
			tier_class = max==2? "tier_odd": "tier_even";
			div.setAttribute("class", tier_class);
			div.setAttribute("id", "tier");
			div.setAttribute("value", tier);
			wrap.append(div);
			ul.append(li);
			li.append(wrap);			
			for(atr=0; atr<max; atr++){
				atrBox = document.createElement("div");
				atrBox.setAttribute("class", "attribute");
				div.append(atrBox);
			}
		}
	}
	
	var totalPoint = 30;
	var m0Point= 0;
	var m1Point= 0;
	var m2Point= 0;
	window.onload=function(){
		addPoint();
	}
	
	function addPoint(){
		$(".attribute").click(function(e){
			if(totalPoint<=0){
				alert("포인트가 부족합니다.");
				return false;
			}
			// 속성 최대치 제한
			var tier = $(this).parents("#tier").attr("value");
			var maxAttr = tier%2==0? 5: 1;
			var attrPoint = e.target.innerHTML;			
			if(attrPoint>=maxAttr){
				alert("더 이상 올릴 수 없습니다.");
				return false;
			}
			
			var tierPoint = 0;
			var length = e.target.parentNode.childNodes.length;
			for(i = 0; i<length; i++){
				tierPoint += e.target.parentNode.childNodes[i].innerHTML/1;					
			}
			// 속성 카운트 자동 조절
			console.log("max:"+attrPoint+"/"+maxAttr);
			if(maxAttr==1 ){	
				console.log("max=1");
				for(i = 0; i<length; i++){
					e.target.parentNode.childNodes[i].innerHTML>=1?
						e.target.parentNode.childNodes[i].innerHTML--:0;
				}				
				e.target.innerHTML = 1;
			}else{
				e.target.innerHTML++;
				if(tierPoint >= 5)				
					for(i = 0; i<length; i++){
						e.target.parentNode.childNodes[i]==e.target? 0:
							e.target.parentNode.childNodes[i].innerHTML>0?
								e.target.parentNode.childNodes[i].innerHTML--:0;
					};			
			}
			//특성 카운트
			switch($(this).parents(".mastery").attr("id")){
			case "m0":
				totalPoint--;
				var p = $("#ferocity").html()/1+1;
				$("#ferocity").html(p);
				console.log(e.target);
				break;
			case "m1":
				totalPoint--;
				var p = $("#cunning").html()/1+1;
				$("#cunning").html(p);
				break;
			case "m2":
				totalPoint--;
				var p = $("#resolve").html()/1+1;
				$("#resolve").html(p);
				break;
			}
			console.log(totalPoint);
		})
		
	}
	
</script>




