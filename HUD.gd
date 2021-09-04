extends CanvasLayer

var nextIndex = 0
var shell_count = 0
var score = 0

func _ready():
	shell_count = $ShellHBoxContainer.get_children().size()

func reload():
	for item in $ShellHBoxContainer.get_children():
		item.visible = true
	nextIndex = 0

func shoot() -> void:
	if nextIndex > shell_count - 1:
		return
	var item = $ShellHBoxContainer.get_child(nextIndex)
	item.visible = false
	nextIndex += 1

func add_score(score_to_add):
	score += score_to_add
	$ScoreHBoxContainer/ScoreValueLabel.text = str(score)
