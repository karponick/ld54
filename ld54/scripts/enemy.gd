extends Node3D

func set_pos(px, py, pz):
	global_position.x = px
	global_position.y = py
	global_position.z = pz
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var speed = 1.1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position.x = move_toward(global_position.x, 0, delta * speed)
	#global_position.y = move_toward(global_position.y, 0, delta * speed)
	#global_position.z = move_toward(global_position.z, 0, delta * speed)
	
	global_position.x = lerp(global_position.x, 0.0, delta * speed)
	global_position.y = lerp(global_position.y, 0.0, delta * speed)
	global_position.z = lerp(global_position.z, 0.0, delta * speed)

func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("lol it works")
		queue_free()
