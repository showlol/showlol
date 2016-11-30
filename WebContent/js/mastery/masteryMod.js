/**
 * 
 */
console.log("masteryMod load...");
	var totalPoint = 30;
	
	$(document).ready(function() {
		addPoint();	
	});
	
	function addPoint() {
		
		$("div.attrBox").click(function(e) {		
			e.target.nodeName == "SPAN" ?
				e.target = e.target.parentNode: 0;
					
				if (totalPoint <= 0) {
					alert("포인트가 부족합니다.");
						return false;
				}
							// 속성 최대치 제한
							var tier = $(this).parent().attr("value");
							var maxAttr = tier % 2 == 0 ? 5 : 1;
							var attrPoint = $(this).children("span").html();
							if (attrPoint >= maxAttr) {
								alert("더 이상 올릴 수 없습니다.");
								return false;
							}
							//이전 티어 체크			
							var currentMasteryId = $(this).parents(".mastery")
									.attr("id");
							if (tier != 0) {
//								if ($("#" + currentMasteryId).find(
//										".tier_odd[value=" + (tier - 1)
//												+ "], .tier_even[value="
//												+ (tier - 1) + "]")
//										.attr("data") != "enough") {
//									alert("이전 속성을 완성하세요.");
//									return false;
//								}
								var boxNum = $(this).attr("id");
								var isEnough=false;
								var mod = Math.floor((boxNum-1)/5);
								var rest = boxNum%5;
								if(rest==1 || rest==2){
									var index = 5*mod-2;
									for(i = index; i<index+3; i++)					
										if($("#mastery_ul").find("#"+i+">span").html()>0){
											isEnough=true;
										}
											
								}else{
									var index = 5*mod+1;
									var enough=0;
									for(i = index; i<index+2; i++){						
										enough += $("#mastery_ul").find("#"+i+">span").html()/1											
									}
									
									isEnough = enough>4 ? true : false;
									console.log("이전 인덱스 계산:"+index+"/"+enough);
								}
							}
							if(isEnough==false){
								alert("이전 속성을 완성하세요.");
								return false;
							}
								
							// 해당 티어 속성 합계 계산
							var tierPoint = 0;
							var length = e.target.parentNode.childNodes.length;
							for (i = 0; i < length; i++) {
								tierPoint += e.target.parentNode.childNodes[i].childNodes[0].innerHTML / 1;
							}
							// 속성 카운트 자동 조절
							if (maxAttr == 1) {
								if (tierPoint >= 1) {
									for (i = 0; i < length; i++) {
										e.target.parentNode.childNodes[i].childNodes[0].innerHTML >= 1 ? e.target.parentNode.childNodes[i].childNodes[0].innerHTML--
												: 0;
									}
								} else {
									totalPoint--;
								}
								e.target.childNodes[0].innerHTML = 1;
								$(this).parent().attr("data", "enough");
							} else {
								if (tierPoint == 4) {
									$(this).parent().attr("data", "enough");
								}

								e.target.childNodes[0].innerHTML++;
								if (tierPoint >= 5) {
									for (i = 0; i < length; i++) {
										e.target.parentNode.childNodes[i] == e.target ? 0
												: e.target.parentNode.childNodes[i].childNodes[0].innerHTML > 0 ? e.target.parentNode.childNodes[i].childNodes[0].innerHTML--
														: 0;
									}
									;

								} else {
									totalPoint--;
								}
							}
							
							//특성 카운트
							var mTotal=0;
							$(this).parents(".mastery").find(".attrBox").each(function(){
								mTotal += this.firstChild.innerHTML/1;
							});
							switch($(this).parents(".mastery").attr("id")){
							case "m0":
								$("#ferocity").html(mTotal);
								break;
							case "m1":
								$("#cunning").html(mTotal);
								break;
							case "m2":
								$("#resolve").html(mTotal);
								break;
							}

							console.log(totalPoint);
		}); // attrBox bind click
		
		$(".attrBox").contextmenu(function(e){
			var boxNum = e.target.getAttribute("id");
			console.log(boxNum);
			if((boxNum-1)%15<12){
				var mod = Math.floor((boxNum-1)/5);
				var rest = boxNum%5;
				if(rest==1 || rest==2){
					var index = 5*mod+3;
					for(i = index; i<index+3; i++)					
						if($("#mastery_ul").find("#"+i+">span").html()>0){
							alert("위 티어를 비워야 합니다.");
							return false;
						}
							
				}else{
					var index = 5*(mod+1)+1;
					for(i = index; i<index+2; i++){						
						if($("#mastery_ul").find("#"+i+">span").html()>0){
							alert("위 티어를 비워야 합니다.");
							return false;
						}
					}
				}
			}
			
			target = e.target.childNodes[0];
			if(target.innerHTML<1){
				alert("더 취소할 수 없습니다.");				
				return false;
			}
			target.innerHTML--;
			totalPoint++;
			console.log(totalPoint);
			return false;
		});
		var btnWidth = 100;
		$("#initMasteryWrap").append("<input type='button' id='initMasteryBtn'"
				+" class='btn-sm btn-danger' value='초기화' style='width:"
				+btnWidth+"; margin-left: "+(-btnWidth/2)+";' >");
		$("#initMasteryBtn").click(function(){
			alert("초기화");
		});
	}//end addPoint