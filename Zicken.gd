extends RigidBody2D

signal hit

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

var flipped = true
var speed = rand_range(min_speed, max_speed) as int


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
	if (event.is_action_pressed("shoot")):
		var parent = get_parent()
		if parent.current_shells >= 0 and not parent.reloading:
			emit_signal("hit")
			print("Shot")
			queue_free()

func _process(delta):
	var change = delta * speed
	if (flipped):
		position.x -= change
	else:
		position.x += change
