extends Node2D

var enemy_array = []
var built = false

func _ready():
	if built:
		self.get_node("Range/CollisionShape2D").get_shape().radius = 0.5 * GameData.tower_data[self.get_name()]["range"]

func _physics_process(delta):
	trun()
	
func trun():
	var enemy_prsition = get_global_mouse_position()
	get_node("Turret").look_at(enemy_prsition)
	

func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)


func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
