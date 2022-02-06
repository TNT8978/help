extends Node

var tower_data = {
##		##
##Arrow  TowerT1##
##		##
	"ArrowTowerT1": {
		"damge" : 20,
		"rof": 0.5,
		"range": 250},
##		##
##Morter TowerT1##
##		##
	"MorterTowerT1": {
		"damge": 50,
		"rof": 1,
		"range": 500}
}

var wave_data = {
	"wave1": [
		["Enemy1", 1.0], ["Enemy1", 0.75], ["Enemy1", 0.5], ["Enemy1", 0.25], ["Enemy1", 0.1]
	],
	"wave2": [
		["Enemy1", 1.0], ["Enemy1", 0.8], ["Enemy1", 0.6], ["Enemy1", 0.4], ["Enemy1", 0.2],
		["Enemy1", 0.1], ["Enemy2", 0.5], ["Enemy2", 0.5], ["Enemy2", 0.5], ["Enemy2", 0.5]
	],
	"wave3":[
		["Enemy1", 1.0], ["Enemy1", 0.9], ["Enemy1", 0.8], ["Enemy1", 0.7], ["Enemy1", 0.6],
		["Enemy1", 0.5], ["Enemy1", 0.4], ["Enemy1", 0.3], ["Enemy1", 0.2], ["Enemy1", 0.1],
		["Enemy1", 0.1], ["Enemy1", 0.1], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5],
		["Enemy3", 0.5], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3]
	],
	"wave4":[
		["Enemy1", 1.0], ["Enemy1", 0.9], ["Enemy1", 0.9], ["Enemy1", 0.8], ["Enemy1", 0.8], 
		["Enemy1", 0.7], ["Enemy1", 0.7], ["Enemy1", 0.6], ["Enemy1", 0.6], ["Enemy1", 0.5], 
		["Enemy1", 0.5], ["Enemy1", 0.4], ["Enemy1", 0.4], ["Enemy1", 0.3], ["Enemy1", 0.3], 
		["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], 
		["Enemy3", 0.5], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3],
		["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3]
	],
	"wave5":[
		["Enemy1", 1.0], ["Enemy1", 0.9], ["Enemy1", 0.9], ["Enemy1", 0.9], ["Enemy1", 0.8], 
		["Enemy1", 0.8], ["Enemy1", 0.8], ["Enemy1", 0.7], ["Enemy1", 0.7], ["Enemy1", 0.7], 
		["Enemy1", 0.6], ["Enemy1", 0.6], ["Enemy1", 0.6], ["Enemy1", 0.5], ["Enemy1", 0.5], 
		["Enemy1", 0.5], ["Enemy1", 0.4], ["Enemy1", 0.4], ["Enemy1", 0.4], ["Enemy1", 0.3], 
		["Enemy1", 0.3], ["Enemy1", 0.3], ["Enemy1", 0.2], ["Enemy1", 0.2], ["Enemy1", 0.2], 
		["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], 
		["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], ["Enemy3", 0.5], 
		["Enemy3", 0.5], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3],
		["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3],
		["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3]
	],
	"wave6":[
		
		["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3],
		["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3], ["Enemy2", 0.3],
		["EnemyBoss1", 1.0]
	]
}
