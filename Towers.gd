extends Node2D

var type
var enemy_array = []
var built = false
var enemy 
var ready = true

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[type]["range"]

# warning-ignore:unused_argument
func _physics_process(delta):
	if enemy_array.size() != 0 and built:
		select_enemy()
		trun()
		if ready:
			fire()
	else:
		enemy = null
	
func trun():
	get_node("Turret").look_at(enemy.position)
	
func select_enemy(): 
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]
func fire():
	ready = false
	enemy.on_hit(GameData.tower_data[type]["damge"])
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]), "timeout")
	ready = true

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)


func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
