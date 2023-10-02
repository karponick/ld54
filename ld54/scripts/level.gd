extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event : InputEvent):
	var paused = get_tree().paused
	#Pause
	if event.is_action_pressed("ui_cancel"):
		if !paused:
			$Pause_Menu.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			$Pause_Menu.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = !paused
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_sens():
	return $Pause_Menu/HSlider.value
