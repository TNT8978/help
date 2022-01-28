extends Node

func _ready():
# warning-ignore:return_value_discarded
	get_node("MainMenu/M/VB/Start").connect("pressed", self, "on_Start_pressed")
# warning-ignore:return_value_discarded
	get_node("MainMenu/M/VB/Exit").connect("pressed", self, "on_Exit_pressed")
# warning-ignore:return_value_discarded
	get_node("MainMenu/M/VB/Tower & Enemy List").connect("pressed", self, "on_TAEL_pressed")

func on_Start_pressed():
	get_node("MainMenu").queue_free()
	var game_scene = load("res://Rogurim/Scenes/GameScene.tscn").instance()
	add_child(game_scene)
func on_Exit_pressed():
	get_tree().quit()
func on_TAEL_pressed():
	get_node("MainMenu").queue_free()
	var TAEL = load("res://Rogurim/Scenes/SceneHandler2ed.tscn").instance()
	add_child(TAEL)
