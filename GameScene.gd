extends Node2D

var map_node

var build_mode = false
var build_vaild = false
var build_location
var build_type

func _ready():
	map_node = get_node("MapRogurim")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])


func _process(delta):
	if build_mode:
		update_tower_preview()


func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		## this is not working.
		print("bob")
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		## this is working
		verify_and_build()
		## ^^^ this is getting hit with a "_unhandled_input()
		cancel_build_mode()


func initiate_build_mode(tower_type):
	build_type = tower_type + "T1"
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())


func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").world_to_map(mouse_position)
	var tile_position = map_node.get_node("TowerExclusion").map_to_world(current_tile)
	
	if map_node.get_node("TowerExclusion").get_cellv(current_tile) == -1:
		get_node("UI").update_tower_preview(tile_position, "adff4545")
		build_vaild = false


func cancel_build_mode():
	build_mode = false
	build_vaild = false
	get_node("UI/TowerPreview").queue_free()


func verify_and_build():
	var new_tower = load("res://Rogurim/Towers/" + build_type + ".tscn").instance()
	new_tower.position = build_location
	map_node.get_node("Towers").add_chaild(new_tower, True)
	## ^^ this is getting hit by 3 things, 1st thing <C++ Error>("Codition "!node" Is True. Returned:nullptr"), 2ed thing <C++ Source>("scen/main/node.cpp:1325 @ get_node()"), last thing <Stack Trace>("GameScene.gd:59 @ verify_and_build").
