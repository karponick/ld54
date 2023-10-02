extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
	#if event.is_action_pressed('left_click'):
		spawn(get_parent().get_arena_radius())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var enemy = preload("res://Scenes/enemy.tscn")

var rng = RandomNumberGenerator.new()
func spawn(r):
	#var x = rng.randf_range(0.1, r)
	#var y = rng.randf_range(0.1, r)
	#var z = rng.randf_range(0.1, r)
	
	var x = rng.randfn()
	var y = rng.randfn()
	var z = rng.randfn()
	r = r + 1
	x = x / (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))) * r
	y = y / (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))) * r
	z = z / (sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2))) * r
	print(x,y,z)
	var new_enemy = enemy.instantiate()
	add_child(new_enemy)
	new_enemy.set_pos(x,y,z)
