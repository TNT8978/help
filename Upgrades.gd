extends Node

var Upgrade_array = {
	1: ["Bigger Arrows"],
	2: ["Faster Fireing"],
	3: ["Bigger Bow"],
	4: ["Thicker Barral"],
	5: ["Faster Fireing Crew"],
	6: ["Longer Barral"],
	7: ["Bigger HP Pool"]
}

var Upgrade_data = [
	"Bigger Arrows": [
		GameData.tower_data["ArrowTowerT1"]["damge"] + 20
	],
	"Faster Fireing": [
		GameData.tower_data["ArrowTowerT1"]["rof"] - 0.3
	],
	"Bigger Bow": [
		GameData.tower_data["ArrowTowerT1"]["range"] + 50
	],
	"Thicker Barral":[
		GameData.tower_data["MorterTowerT1"]["damge"] + 50
	],
	"Faster Fireing Crew":[
		GameData.tower_data["MorterTowerT1"]["rof"] - 0.5
	],
	"Longer Barral":[
		GameData.tower_data["MorterTowerT1"]["range"] + 100
	],
	"Bigger HP Pool":[
		
	],
]
var ActtaveUpgrades = {}
