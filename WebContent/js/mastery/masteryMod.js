/**
 * 
 */
console.log("masteryMod load...");
	var totalPoint = 30;
	var m0Point = 0;
	var m1Point = 0;
	var m2Point = 0;
	$(document).ready(function() {
		addPoint();
		addAttr();
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
								if ($("#" + currentMasteryId).find(
										".tier_odd[value=" + (tier - 1)
												+ "], .tier_even[value="
												+ (tier - 1) + "]")
										.attr("data") != "enough") {
									alert("이전 속성을 완성하세요.");
									return false;
								}
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
							switch ($(this).parents(".mastery").attr("id")) {
							case "m0":
								var p = $("#ferocity").html() / 1 + 1;
								$("#ferocity").html(p);
								break;
							case "m1":
								var p = $("#cunning").html() / 1 + 1;
								$("#cunning").html(p);
								break;
							case "m2":
								var p = $("#resolve").html() / 1 + 1;
								$("#resolve").html(p);
								break;
							}
							console.log(totalPoint);
		}); // attrBox bind click
		$(".attrBox").contextmenu(function(){
			alert("우클릭");
		});
		var btnWidth = 100;
		$("#initMasteryWrap").append("<input type='button' id='initMasteryBtn'"
				+" class='btn btn-danger' value='초기화' style='width:"
				+btnWidth+"; margin-left: "+(-btnWidth/2)+";' >");
		$("#initMasteryBtn").click(function(){
			alert("초기화");
		});
	}//end addPoint