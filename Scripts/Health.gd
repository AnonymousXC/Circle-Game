extends ProgressBar

onready var global = get_node("/root/LoadScripts")

func _process(_delta: float) -> void:
	value = global.health
	if global.ball_life_state == 1:
		value = 0
	if global.ball_life_state == 1:
		visible = false
