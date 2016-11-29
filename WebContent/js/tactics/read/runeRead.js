/**
 * 
 */
	
	console.log("runeRead load...");
	
	var runeList = [];
	var runeKind = {};
	var runeAbil = {};
	var runeAbility="";
	
	$.get("/gameData/runeTier3", function(e){
		runeList=e;
	});

	$.get("/gameData/runeAbil", function(e){
		runeAbil=e;			
	});		


	$.get("/gameData/runeKind", function(e){			
		runeKind=e;
	});			
$("runeRead.js").ready(function(){
	console.log(runeKind);
	$.get("/JSON/rune", function(list){		
		for(var num=0; num<runeData.length-1; num++){						
			var id = runeData[num];			
			if(id=="undefined"){				
				continue;
			}			
			var img = list[id].image.full;
			var type = list[id].rune.type;
			
			var runeBox = "<div id='rune' type='"+type+"' value='"+id
			+"' title='"+list[id].description+"' style='height: 40px; width: 40px;"
			 +"background-image: url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/"+img+"\");"
			 +"background-size: cover; '></div>";
			$("#runeNum"+num).append(runeBox);
			
			var abilist = runeAbil[id][0];
			runeKind[abilist[0]]+=abilist[1];			
		}
		console.log(runeKind);
		var runeAbility="";
		var keys = Object.keys(runeKind);
		console.log(runeKind[keys[0]]);
		keys.forEach(function(key){
			if(runeKind[key]!=0){
				runeAbility += key+":"+runeKind[key]+" / ";
			}			
		});
		$("#runeAbility").html(runeAbility);
	});
});	
	
		
