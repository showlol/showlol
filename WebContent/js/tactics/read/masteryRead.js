/**
 * 
 */
console.log("masteryRead load...");
masteryData.forEach(function(data, num){
	$(".attrBox[id="+(num+1)+"]").children("#point").html(data);
});
