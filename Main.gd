extends Node

export (PackedScene) var Mob
export (float) var reload_time = 1
var score
var rng = RandomNumberGenerator.new()

const INITIAL_SHELLS = 5
var current_shells = INITIAL_SHELLS
var reloading = false

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
	mob.connect("hit", $HUD, "add_score")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if reloading:
			return
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				current_shells -= 1
				$HUD.shoot()
				if current_shells >= 0:
					$WeaponShootSound.play()
					print("Shells left: ", current_shells)
		elif event.button_index == BUTTON_RIGHT:
			if event.pressed:
				$WeaponReloadSound.play()
				reloading = true
				$HUD.reload()
				yield(get_tree().create_timer(reload_time), "timeout")
				current_shells = INITIAL_SHELLS
				reloading = false
