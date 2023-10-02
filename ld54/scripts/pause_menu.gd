extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Quit
func _on_button_pressed():
	get_tree().quit()


func _on_h_slider_value_changed(value):
	return value

#Continue
func _on_button_2_pressed():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = !get_tree().paused


func _on_h_slider_2_value_changed(value):
	get_parent().set_fov(value)
