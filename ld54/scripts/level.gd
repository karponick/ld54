extends Node3D

@onready var playing = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _input(event : InputEvent):
	var paused = get_tree().paused
	#Pause
	if event.is_action_pressed("ui_cancel") and playing:
		if !paused:
			$Pause_Menu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			$Pause_Menu.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = !paused
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_sens():
	return $Pause_Menu/HSlider.value

func get_arena_radius():
	return $Arena.radius
	
func set_fov(v):
	$Player/Camera3D.fov = v

func damage_taken():
	#print('damage taken')
	$Player.reduce_health()

func game_over():
	$ColorRect.show()
	playing = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = !get_tree().paused


func _on_button_pressed():
	var fovv = $Player/Camera3D.fov
	var senss = get_sens()
	get_tree().reload_current_scene()
	get_tree().paused = false
	
