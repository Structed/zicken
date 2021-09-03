extends Node

export (PackedScene) var Mob
var score
var rng = RandomNumberGenerator.new()


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
