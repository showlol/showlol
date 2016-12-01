/**
 * 
 */
console.log("skillRead load...");
var skillTree={
		level : 0,
		0 : 0,
		1 : 0,
		2 : 0,
		3 : 0,
};
$.get("/champData/"+champKey, function(r){
	console.log(r.spells);
	var spells = r.spells;	
	var level=0;	
	try{
		for(i=0; i<skillBuild.length-1; i++){		
			var img = spells[skillBuild[i]].image.full;
			var spell = 
				"<img id='setSkill' class='img-rounded' info='"
				+skillBuild[i]+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/spell/"
				+img+"' width='60' height='60' >"
				
			level++;
			
			skillTree.level = level;
			skillTree[skillBuild[i]]++;		
			
			if(level>1){
					var arrow = "<img src='/image/collection/arrow4.jpg' width='40' height='40' >";
					$("#skillTree").append(arrow);
			}		
			$("#skillTree").append(spell);
			if(level%6==0)
				$("#skillTree").append("<br/>");
		}
	}catch(err){
		alert("스킬트리를 읽을 수 없습니다.");
	}
		
					
});