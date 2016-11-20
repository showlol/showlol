<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
	<link href="/css/tactics.css" rel="stylesheet" >
</head>	
	<ul class="mastery_title" >
		<li >흉포 : <b id="ferocity" name="m0">0</b>
		<li >교활 : <b id="cunning" name="m1">0</b>
		<li >결의 : <b id="resolve" name="m2">0</b>
	</ul>	
	<span class="clearfix"><br></span>
	<ul class="mastery_ul" id="mastery_ul"></ul>
	
<script>
	
	var m_ul = $(".mastery_ul")[0];
	var attrNum=0;
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
			var max, maxPoint;
			if(tier%2==0){
				max=2; maxPoint=5;
			}else{
				max=3; maxPoint=1;
			}
			
			tier_class = max==2? "tier_odd": "tier_even";
			div.setAttribute("class", tier_class);
			div.setAttribute("id", "tier");
			div.setAttribute("value", tier);
			div.setAttribute("data", "lack");
			wrap.append(div);
			ul.append(li);
			li.append(wrap);			
			for(atr=0; atr<max; atr++){ //속성 상자 붙이기
				attrNum++;
				attrBox = document.createElement("div");
				attrBox.setAttribute("class", "attrBox");
				attrBox.innerHTML="<span id='point'>0</span>/"+maxPoint;
				$(attrBox).attr("id", attrNum);				
				div.append(attrBox);
			}
		}
	}
	
	var totalPoint = 30;
	var m0Point= 0;
	var m1Point= 0;
	var m2Point= 0;
	$(document).ready(function(){
		addPoint();
		addAttr();
	});
	
	function addPoint(){
		
		$("div.attrBox").click(function(e){
			e.target.nodeName=="SPAN"? e.target=e.target.parentNode : 0;
			
			if(totalPoint<=0){
				alert("포인트가 부족합니다.");
				return false;
			}
			// 속성 최대치 제한
			var tier = $(this).parent().attr("value");
			var maxAttr = tier%2==0? 5: 1;
			var attrPoint = $(this).children("span").html();			
			if(attrPoint>=maxAttr){
				alert("더 이상 올릴 수 없습니다.");
				return false;
			}
			//이전 티어 체크			
 			var currentMasteryId = $(this).parents(".mastery").attr("id");
			console.log("현재 마스터리:"+$("#"+currentMasteryId).attr("id"));
			if(tier!=0){				
				if($("#"+currentMasteryId).find(".tier_odd[value="+(tier-1)+"], .tier_even[value="+(tier-1)+"]")
					.attr("data") != "enough"){
					alert("이전 속성을 완성하세요.");
					return false;
				}
			}
			// 해당 티어 속성 합계 계산
			var tierPoint = 0;
			var length = e.target.parentNode.childNodes.length;
			for(i = 0; i<length; i++){
				tierPoint += e.target.parentNode.childNodes[i].childNodes[0].innerHTML/1;					
			}
			console.log("티어포인트"+tierPoint);
			// 속성 카운트 자동 조절
			console.log("지금data"+e.target.parentNode.getAttribute("data"));
			
			if(maxAttr==1 ){
				if(tierPoint >= 1){
					for(i = 0; i<length; i++){
						e.target.parentNode.childNodes[i].childNodes[0].innerHTML>=1?
							e.target.parentNode.childNodes[i].childNodes[0].innerHTML--:0;
					}			
				}else{
					totalPoint--;
				}					
				e.target.childNodes[0].innerHTML = 1;
				$(this).parent().attr("data", "enough");
			}else{
				if(tierPoint==4){
					$(this).parent().attr("data", "enough");
					console.log("데이터완료:"+e.target.parentNode.getAttribute("data"));
				}		
				
				e.target.childNodes[0].innerHTML++;
				if(tierPoint >= 5){
					console.log("합계 5이상");
					for(i = 0; i<length; i++){
						e.target.parentNode.childNodes[i]==e.target? 0:
							e.target.parentNode.childNodes[i].childNodes[0].innerHTML>0?
								e.target.parentNode.childNodes[i].childNodes[0].innerHTML--:0;
					};
					
				}else{
					totalPoint--;
				}				
						
			}
			//특성 카운트
			switch($(this).parents(".mastery").attr("id")){
			case "m0":
				var p = $("#ferocity").html()/1+1;
				$("#ferocity").html(p);
				console.log(e.target);
				break;
			case "m1":
				var p = $("#cunning").html()/1+1;
				$("#cunning").html(p);
				break;
			case "m2":
				var p = $("#resolve").html()/1+1;
				$("#resolve").html(p);
				break;
			}
			console.log(totalPoint);
		})
		
	}//end addPoint
	function addAttr(){
		var attrList=[];
		$.get("/data/mastery", function(r){
			attrList=r;
			attrList.forEach(function(list, i) {
				var attrBox = $("#mastery_ul").find("#"+(i+1));
				attrBox.css("background-image",
					'url("http://ddragon.leagueoflegends.com/cdn/6.22.1/img/mastery/'+list.id+'.png")' );
		 		attrBox.css("background-size", "cover");
		 		attrBox.attr("title", list.description);
			})
		});	
	}
	
	

	
</script>




