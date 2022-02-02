extends Node2D

signal game_finished(result)

var map_node

var build_mode = false
var build_vaild = false
var build_tile
var build_location
var build_type
var no_enemys = false

var current_wave = 0
var enemies_in_wave = 0

var base_health = 20

##
## Updates Tower Preview
## handls unhandle inputs
##

func _ready():
	map_node = get_node("MapRogurim")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
		
	

onready var Timer1 = $Timer1
onready var Timer2 = $Timer2
onready var Timer1Delay: float = 10
onready var Timer2Delay: float = 25

func _process(_delta):
	if build_mode:
		update_tower_preview()
	

func _physics_process(delta):
	Timer2.start(Timer2Delay)
	if Timer1.is_stopped():
		no_Enemys()
	

func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode ==true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
		cancel_build_mode()
		
	

##
## Wave Functions
##

func start_next_wave():
	var wave_data = retrieve_wave_data()
	yield(get_tree().create_timer(0.2), "timeout")
	spawn_enemies(wave_data)
	

func retrieve_wave_data():
	var wave_type = "wave%d" % current_wave
	var wave_data = GameData.wave_data[wave_type]
	enemies_in_wave = wave_data.size()
	return wave_data
	

func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Rogurim/Badguys_pngs/Enemies/" + i[0] + ".tscn").instance()
		new_enemy.connect("base_damage", self, 'on_base_damage')
		map_node.get_node("Path").add_child(new_enemy, true)
		yield(get_tree().create_timer(i[1]), "timeout")
		
	

func no_Enemys():
	var enemys = get_node("MapRogurim/Path")
	var Enemys = enemys.get_children()
	
	if Enemys.size() == 0:
		no_enemys = true
		No_Enemys()
	

func No_Enemys():
	if no_enemys and Timer2.is_stopped():
		Next_Wave()
		Timer1.start(Timer1Delay)
		no_enemys = false
		

func Next_Wave():
	current_wave += 1
	

##
## Building functions
##

func initiate_build_mode(tower_type):
	
	if build_mode:
		cancel_build_mode()
	build_type = tower_type + "T1"
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())
	

func update_tower_preview():
	
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").world_to_map(mouse_position)
	var tile_position = map_node.get_node("TowerExclusion").map_to_world(current_tile)
	
	if map_node.get_node("TowerExclusion").get_cellv(current_tile) == -1:
		get_node("UI").update_tower_preview(tile_position, "1aff00")
		build_vaild = true
		build_location = tile_position
		build_tile = current_tile
		
	else:
		get_node("UI").update_tower_preview(tile_position, "adff4545")
		build_vaild = false
		
	

func cancel_build_mode():
	
	build_mode = false
	build_vaild = false
	get_node("UI/TowerPreview").free()
	

func verify_and_build():
	
	var new_tower = load("res://Rogurim/Towers/" + build_type + ".tscn").instance()
	new_tower.position = build_location
	new_tower.built = true
	new_tower.type = build_type
	map_node.get_node("Towers").add_child(new_tower, true)
	map_node.get_node("TowerExclusion").set_cellv(build_tile, 2)
	

##
## Base Damage Function
##

func on_base_damage(damage):
	
	base_health -= damage
	
	if base_health <= 0:
		emit_signal("game_finished", false)
		
	else:
		get_node("UI").update_health_bar(base_health)
		
	
