/**
 * 
 */
console.log("masteryJS loading...");
	var m_ul = $(".mastery_ul")[0];
	var attrNum = 0;
	for (mas = 0; mas < 3; mas++) {
		var div = document.createElement("div");
		div.setAttribute("class", "mastery");
		div.setAttribute("id", "m" + mas); //마스터리 아이디 입력
		console.log($(div));
		$(div).css("background-image", "url('http://ddragon.leagueoflegends.com/cdn/img/champion/loading/"+champKey+"_"+mas+".jpg')");
		var li = document.createElement("li");
		m_ul.append(li);
		li.append(div);
		var ul = document.createElement("ul");
		div.append(ul);
		for (tier = 0; tier < 6; tier++) {
			var li = document.createElement("li");
			var wrap = document.createElement("div");
			wrap.setAttribute("id", "wrap");
			var div = document.createElement("div");
			var max, maxPoint;
			if (tier % 2 == 0) {
				max = 2;
				maxPoint = 5;
			} else {
				max = 3;
				maxPoint = 1;
			}

			tier_class = max == 2 ? "tier_odd" : "tier_even";
			div.setAttribute("class", tier_class);
			div.setAttribute("id", "tier");
			div.setAttribute("value", tier);
			div.setAttribute("data", "lack");
			wrap.append(div);
			ul.append(li);
			li.append(wrap);
			for (atr = 0; atr < max; atr++) { //속성 상자 붙이기
				attrNum++;
				attrBox = document.createElement("div");
				attrBox.setAttribute("class", "attrBox");
				attrBox.innerHTML = "<span id='point'>0</span>/" + maxPoint;
				$(attrBox).attr("id", attrNum);
				div.append(attrBox);
			}
		}
	}
	addAttr();
	function addAttr() {
		var attrList = [];
		$.get("/data/mastery", function(r) {
			attrList = r;
			attrList.forEach(function(list, i) {
				var attrBox = $("#mastery_ul").find("#" + (i + 1));
				attrBox.css("background-image",
						'url("http://ddragon.leagueoflegends.com/cdn/6.22.1/img/mastery/'
								+ list.id + '.png")');
				attrBox.css("background-size", "cover");
				attrBox.attr("title", list.description);
			})
		});
	}