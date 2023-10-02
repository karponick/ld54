extends Node3D

var look_sens: float = ProjectSettings.get_setting("player/look_sensitivity")

@onready var camera := $Camera3D
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sens)
		camera.rotate_x(-event.relative.y * look_sens)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
	#if event.is_action_pressed('left_click'):
		#get_parent().shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_sens = get_parent().get_sens() / 1000

func shoot():
	pass
