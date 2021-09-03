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
	
	var viewport_size = get_viewport().size
	var x = rng.randf_range(0, viewport_size.x)
	var y = rng.randf_range(0, viewport_size.y)
	var position = Vector2(x, y)
	
	mob.position = position
	var orientation = rng.randf()
	
	var anim_sprite = mob.get_node("AnimatedSprite")
	anim_sprite.play()
	if (orientation < 0.5):
		# mob.rotation_degrees = 0
		anim_sprite.set_flip_h(false)
	else:
#		# mob.rotation_degrees = 180
		anim_sprite.set_flip_h(true)
