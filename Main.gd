extends Node

export (PackedScene) var Mob
var score
var rng = RandomNumberGenerator.new()

const INITIAL_SHELLS = 5
var current_shells = INITIAL_SHELLS

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	start_game()
	
func start_game():
	$MobTimer.start()
	
func game_over():
	$MobTimer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MobTimer_timeout():
	var mob = Mob.instance()
	add_child(mob)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				current_shells -= 1
				print("Left button was clicked at ", event.position)
				print("Shells left: ", current_shells)
			else:
				print("Left button was released")
