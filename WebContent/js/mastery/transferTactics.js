/**
 * 
 */
		
		console.log("transferTactics load...");
		var masteryData = ""; //마스터리는 1부터 30까지
		for (i = 1; i <= 45; i++) {
			masteryData += $("#" + i).children("#point").html() + "#";
		}
		var runeData = "";
		for (i = 0; i < 30; i++) {
			runeData += $("#runeNum" + i).children("div:first").attr("value")
					+ "#";
		}
		var skillBuild = "";
		console.log("스킬트리 찾기");
		console.log($("#skillTree").children("img[id='setSkill']"));
		$("#skillTree").children("img[id='setSkill']").each(function(elt){
			console.log("이미지 찾기");
			console.log(this);
			skillBuild += this.getAttribute("info")+"#";
		});
		var itemBuild = "";
		$("#itemTree").children("img").each(function(elt){
			itemBuild += this.getAttribute("info")+"#";
		});
		
		$("#tacticsModForm").append("<input type='hidden' name='masteryData' value='"+masteryData+"' />");
		$("#tacticsModForm").append("<input type='hidden' name='skillBuild' value='"+skillBuild+"' />");
		$("#tacticsModForm").append("<input type='hidden' name='runeData' value='"+runeData+"' />");
		$("#tacticsModForm").append("<input type='hidden' name='itemBuild' value='"+itemBuild+"' />");
		
