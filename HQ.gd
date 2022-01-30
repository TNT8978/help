extends Node2D


onready var HQ_AP = get_node("Hq/HQ_Heart")


onready var HQ_Play_Rando = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26] 

func _ready():
	randomize()
	HQ_Play_Rando.shuffle()
	if HQ_Play_Rando[0] == 1:
		HQ_AP.play(Animation, "1Loop")
	else:
		HQ_AP.play(Animation, "1StandBy")
		### "Invalid type in function 'play' in base "AnimatedSprite'. Cannot convert argument ->
		### -> 1 from Object to String." on line 15. This is with the fix
