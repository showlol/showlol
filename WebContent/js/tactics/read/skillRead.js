/**
 * 
 */
console.log("skillRead load...");
$.get("/champData/"+champKey, function(r){
	var spells = r.spells;
	for(i=0; i<skillBuild.length-1; i++){
		var img = spells[skillBuild[i]].image.full;
		var spell = 
			"<img id='setSkill' info='"
			+skillBuild[i]+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
			+img+"'>"		
		$("#skillTree").append(spell);		
		var arrow = "<h1 style='display:inline;'>→</h1>";
		$("#skillTree").append(arrow);	
	}	
					
});