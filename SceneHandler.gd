
func _ready():
	load_main_menu()
	
func load_main_menu():
	get_node("MainMenu/M/VB/Start").connect("pressed", self, "on_Start_pressed")
	get_node("MainMenu/M/VB/Exit").connect("pressed", self, "on_Exit_pressed")
	get_node("MainMenu/M/VB/Tower & Enemy List").connect("pressed", self, "on_TAEL_pressed")
	
func on_Start_pressed():
	get_node("MainMenu").queue_free()
	var game_scene = load("res://Rogurim/Scenes/GameScene.tscn").instance()
	game_scene.connect("game_finished", self, 'unload_game')
	## This is getting FUCKING HIT BY " connect: In Object of type 'Node2D':Attempt to connect to nonexistent signal 'game_finished' to method 'Node.unload_game'."
	add_child(game_scene)
	
func on_Exit_pressed():
	get_tree().quit()
func on_TAEL_pressed():
	get_node("MainMenu").queue_free()
	var TAEL = load("res://Rogurim/Scenes/SceneHandler2ed.tscn").instance()
	add_child(TAEL)
func unload_game(result):
	get_node("GameScene").queue_free() 
	var main_menu = load("res://Rogurim/Scenes/MainMenu.tscn")
	add_child(main_menu)
	load_main_menu()
