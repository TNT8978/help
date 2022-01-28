extends Node

func _ready():
# warning-ignore:return_value_discarded
	get_node("Tower&EnemyList/M/GB").connect("pressed", self, "on_TAEL_pressed")

func on_TAEL_pressed():
	get_node("Tower&EnemyList").queue_free()
	var Mainmenu = load("res://Rogurim/Scenes/SceneHandler.tscn").instance()
	add_child(Mainmenu)
