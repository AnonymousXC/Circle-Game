extends Control

onready var global = get_node("/root/LoadScripts")

func _ready() -> void:
	visible = false
	$Label.visible = false
	
func _process(delta: float) -> void:
	if global.pause_state == true:
		visible = true




func _on_Button_pressed() -> void:
	global.ball_life_state = 0
	global.health = 100
	global.score = 0
	global.pause_state = false
	$Label.visible = true
	yield(get_tree().create_timer(1),"timeout")
	get_tree().reload_current_scene()


func _on_Button2_pressed() -> void:
	get_tree().quit()
