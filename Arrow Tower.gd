extends Node2D


# warning-ignore:unused_argument
func _physics_process(delta):
	trun()
	
func trun():
	var enemy_prsition = get_global_mouse_position()
	get_node("BowAin1").look_at(enemy_prsition)
