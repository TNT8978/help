extends Node





















var Upgrades = {
	"Arrow Tower Upgrades": {
		"Bigger Arrows": [
			GameData.tower_data["ArrowTowerT1"]["damge"] + 20
		],
		"Faster Fireing": [
			GameData.tower_data["ArrowTowerT1"]["rof"] - 0.3
		],
		"Bigger Bow": [
			GameData.tower_data["ArrowTowerT1"]["range"] + 50
		]
	},
	"All Towers Upgrades":{
		
	},
	"Morter Tower Upgrades":{
		"Thicker Barral":[
			GameData.tower_data["MorterTowerT1"]["damge"] + 50
		],
		"Faster Fireing Crew":[
			GameData.tower_data["MorterTowerT1"]["rof"] - 0.5
		],
		"Longer Barral":[
			GameData.tower_data["MorterTowerT1"]["range"] + 100
		]
	},
	"HQ Upgrades":{
		"Bigger HP Pool":[
			
		],
	}
}
