extends Node2D


onready var HQ_AP = get_node("Hq/HQ_Heart")


onready var HQ_Play_Rando = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26] 

func _ready():
	randomize()
	HQ_Play_Rando.shuffle()
	if HQ_Play_Rando[0] == 1:
		HQ_AP.play("1Loop")
		print("Loop have happen")
	else:
		HQ_AP.play("1StandBy")
		print("StandBy have happen")

