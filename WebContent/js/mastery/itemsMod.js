/**
 * 
 */
var tags = [ "Bilgewater", "Mana", "Slow", "CooldownReduction", "Armor",
			"HealthRegen", "OnHit", "SpellVamp", "GoldPer", "LifeSteal",
			"ManaRegen", "Damage", "Aura", "Tenacity", "ArmorPenetration",
			"Consumable", "Health", "Lane", "NonbootsMovement", "SpellDamage",
			"AttackSpeed", "Active", "Vision", "MagicPenetration", "Boots",
			"CriticalStrike", "Jungle", "Stealth", "Trinket", "SpellBlock" ]

	$.get("/gameData/item/tags", function(r) {
	});
	$.get("/gameData/item/detail", function(r) {
		appendItem(r);
	});
	var itemKind = {
		jungle : [ "Jungle" ],
		support : [ "GoldPer", "Aura", "Vision", "Stealth", "Trinket" ],
		attack : [ "OnHit", "LifeSteal", "Damage", "ArmorPenetration",
				"AttackSpeed", "CriticalStrike" ],
		defence : [ "Armor", "HealthRegen", "Tenacity", "Health", "SpellBlock" ],
		magic : [ "Mana", "CooldownReduction", "SpellVamp", "ManaRegen",
				"SpellDamage", "MagicPenetration" ],
		move : [ "NonbootsMovement", "Boots" ]
	}

	function appendItem(r) {
		Object.keys(r).forEach(
			function(id) {
				Object.keys(itemKind).forEach(
						function(listName) {
							var size = itemKind[listName].length;
							for (i = 0; i < size; i++) {
								if (JSON.stringify(r[id].tags).includes(
									itemKind[listName][i])) {
										$("#div-" + listName).append(
												"<img title='+"+r[id].name+"' info='"+id+"' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/"
												+r[id].image.full+"'>");
										break;
									}
							}
						});
		});
	}
	$("button").click(function() {
		$("#itemBox").children("div").hide();
		$("#div-" + this.id).show(500);
	});
	var itemBuild = "";
	$("#itemBox").click(function(e) {
		console.log($("#itemTree").children("img").length);
		itemBuild += e.target.getAttribute('info') + "#";
		$("#itemTree").append(e.target.cloneNode());
	});