extends CanvasLayer

onready var global = get_node("/root/LoadScripts")

func _process(delta: float) -> void:
	$Label.text = str(global.score) 

