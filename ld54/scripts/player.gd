extends Node3D

var look_sens: float = ProjectSettings.get_setting("player/look_sensitivity")

@onready var camera := $Camera3D
@onready var raycast = $Camera3D/RayCast3D

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sens)
		camera.rotate_x(-event.relative.y * look_sens)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
		#get_viewport().warp_mouse(get_viewport().size / 2)
	#if event.is_action_pressed('left_click'):
		#get_parent().shoot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_sens = get_parent().get_sens() / 1000
	if Input.is_action_pressed("left_click"):
		shoot()

func set_sens(v):
	look_sens = v
	
@onready var score = 0;
func shoot():
	raycast.force_raycast_update()
	var collider = raycast.get_collider()
	if collider and collider.get_collision_mask_value(2):
		collider.queue_free()
		score += 1
		$Label.text = str(score)

@onready var health = 500
func reduce_health():
	health -= 25
	$ColorRect/Label.text = str(health / 25)
	$ColorRect.size.x = health
	if health == 0:
		get_parent().game_over()
