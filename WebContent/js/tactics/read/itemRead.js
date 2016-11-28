/**
 * 
 */
console.log("itemBuild Load...");
var detailItems={};
	$.get("/gameData/item/detail", function(list) {
		detailItems = list;		
		for(i=0; i<itemBuild.length-1; i++){
			var img = list[itemBuild[i]].image.full;
			$("#itemTree").append("<img title='+"+list[itemBuild[i]]+"' info='"+itemBuild[i]+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/"
					+img+"'>");			
		}		
	});