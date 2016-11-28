<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="min-height: 400px; overflow-y: auto;">
		
		<div style='display: inline-block; height: inherit; float: left;'>
			<button id='jungle' type='button' class='btn btn-primary'
				style='display: block;'>정글</button>
			<button id='support' type='button' class='btn btn-primary'
				style='display: block;'>서폿</button>
			<button id='attack' type='button' class='btn btn-primary'
				style='display: block;'>공격</button>
			<button id='defence' type='button' class='btn btn-primary'
				style='display: block;'>방어</button>
			<button id='magic' type='button' class='btn btn-primary'
				style='display: block;'>마법</button>
			<button id='move' type='button' class='btn btn-primary'
				style='display: block;'>이동</button>
		</div>
		<div id="itemBox" style="diplay: iniline-block;">
			<div id="div-jungle" style='display: block;'></div>
			<div id="div-support" style='display: none;'></div>
			<div id="div-attack" style='display: none;'></div>
			<div id="div-defence" style='display: none;'></div>
			<div id="div-magic" style='display: none;'></div>
			<div id="div-move" style='display: none;'></div>
		</div>
		<div id="itemTree" style='clear: left;'>
			ItemTree<br />
		</div>
		<input type='hidden' name='itemBuild' value="aaa" />
	<textarea name="itemContent" id="itemContentd"></textarea>
	<script>
			CKEDITOR.replace('itemContent');
		</script>
</div>

<script>
	var tags = [];

	$.get("/gameData/item/tags", function(r) {
		tags = r;
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
		Object.keys(r).forEach( function(id) {
			Object.keys(itemKind).forEach(function(listName) {
					var size = itemKind[listName].length;
					for (i = 0; i < size; i++) {
						if (JSON.stringify(r[id].tags).includes(itemKind[listName][i])) {
							$("#div-" + listName).append(
								"<img title='+" + r[id].name + "' info='" + id + "' src='http://ddragon.leagueoflegends.com/cdn/6.22.1/img/item/"
								+ r[id].image.full + "'>");
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
	$("#itemBox").click(function(e) {
		$("#itemTree").append(e.target.cloneNode());
	});
</script>
