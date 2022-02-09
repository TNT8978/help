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

func _process(_delta):
	if build_mode:
		update_tower_preview()

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

func _on_Timer2_timeout():
	no_Enemys()
	ButtonStuff()
	UpgradeNameTextStuff()

func ButtonStuff():
	if no_enemys:
		var NextWaves = $UI/Hud/GameControls/NextWave
		var UpgradeCards = $UI/Hud/CardsHud
		UpgradeCards.visible = true
		NextWaves.visible = true
		no_enemys = false

onready var UpgradePath1 = $UI/Hud/CardsHud/UpgradePath1
onready var UpgradePath2 = $UI/Hud/CardsHud/UpgradePath2
onready var UpgradePath3 = $UI/Hud/CardsHud/UpgradePath3

onready var Button1 = $UI/Hud/CardsHud/UpgradePath1/UpgradePath1Button.connect("pressed", self, 'UpgradeButtonStuff')
onready var Button2 = $UI/Hud/CardsHud/UpgradePath2/UpgradePath2Button.connect("pressed", self, 'UpgradeButtonStuff')
onready var Button3 = $UI/Hud/CardsHud/UpgradePath3/UpgradePath3Button.connect("pressed", self, 'UpgradeButtonStuff')

onready var UpgradeNameText1 = $UpgradePath1/UpgradePath1Name
onready var UpgradeNameText2 = $UpgradePath2/UpgradePath2Name
onready var UpgradeNameText3 = $UpgradePath3/UpgradePath3Name

onready var Upgradedata = Upgrades.Upgrade_data
onready var Upgradearry = Upgrades.Upgrade_array

func UpgradeButtonStuff():
	var UpgradeCards = $UI/Hud/CardsHud
	if Button1:
		UpgradeCards.visible = false
	if Button2:
		UpgradeCards.visible = false
	if Button3:
		UpgradeCards.visible = false

func UpgradeNameTextStuff():
	var UpgradThing = Upgradedata + Upgradearry
	UpgradeNameText1.Label_text = str("", UpgradThing[0])
	UpgradeNameText2.Label_text = str("", UpgradThing[1])
	UpgradeNameText3.Label_text = str("", UpgradThing[2])

func no_Enemys():
	var enemy_count = get_node("MapRogurim/Path").get_child_count()
	if enemy_count == 0:
		no_enemys = true

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
# ssss
