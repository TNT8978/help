extends Node

var tower_data = {
##				##
##Arrow  TowerT1##
##				##
	"ArrowTowerT1": {
		"damge" : 20,
		"rof": 1,
		"range": 150},
##				##
##Morter TowerT1##
##				##
	"MorterTowerT1": {
		"damge": 50,
		"rof": 2,
		"range": 500},
##				##
## Arrow  Tower ##
##				##
	"ArrowTower" : {
		"damge" : 20,
		"rof": 1,
		"range": 150},
##				##
## Morter Tower ##
##				##
	"MorterTower": {
		"damge": 50,
		"rof": 2,
		"range": 500}}

var wave_data_number = {
	"wave1": [
		["Enemy1", 1.0], ["Enemy3", 1.0], ["Enemy1", 1.0], ["Enemy2", 1.0], ["Enemy1", 1.0]
	],
	"wave2": [
		["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0],
		["Enemy1", 1.0], ["Enemy3", 1.0], ["Enemy3", 1.0], ["Enemy2", 1.0], ["Enemy2", 1.0]
	],
	"wave3":[
		["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0],
		["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy1", 1.0],
		["Enemy1", 1.0], ["Enemy1", 1.0], ["Enemy3", 1.0], ["Enemy3", 1.0], ["Enemy3", 1.0],
		["Enemy3", 1.0], ["Enemy2", 1.0], ["Enemy2", 1.0], ["Enemy2", 1.0], ["Enemy2", 1.0]
	]
}
