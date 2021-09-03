extends RigidBody2D

signal hit

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

var rng = RandomNumberGenerator.new()
var flipped = true


func _ready():
	var viewport_size = get_viewport().size
	if randi() % 2:
		flipped = false    
	
	$AnimatedSprite.play()
	$AnimatedSprite.set_flip_h(flipped)
	
	var margin_y = 1224 * $AnimatedSprite.scale.y
	var x = viewport_size.x if flipped else 0
	var y = rand_range(0 + margin_y, viewport_size.y - margin_y)
	
	position = Vector2(x, y);


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Zicken_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
