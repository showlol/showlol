/**
 * 
 */
console.log("masteryRead load...");
var m1=0, m2=0, m3=0;
console.log("mastery total:"+totalPoint);
for(i=0; i<masteryData.length-1; i++){
	data = parseInt(masteryData[i]);
	totalPoint -= data;	
	$(".attrBox[id="+(i+1)+"]").children("#point").html(data);
	if(i<15)
		m1+=data;
	if(i>=15 && i<30)
		m2+=data;
	if(i>=30 && i<=45)
		m3+=data;	
}
$("#ferocity").html(m1);
$("#cunning").html(m2); 
$("#resolve").html(m3); 

