extends RigidBody2D

signal hit

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

func _ready():
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Zicken_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
