/**
 * 
 */
	var runeData2 = runeData;	
	$.get("/JSON/rune", function(list){		
		for(var num=0; num<runeData2.length-1; num++){						
			var id = runeData2[num];			
			if(id=="undefined"){				
				continue;
			}			
			var img = list[id].image.full;
			$("#runeNum"+i).css(
					"background-image",
					'url(\"http://ddragon.leagueoflegends.com/cdn/6.22.1/img/rune/'+img+'\")'
			);
		}
	});
		
