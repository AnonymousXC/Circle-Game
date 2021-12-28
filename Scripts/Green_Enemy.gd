extends KinematicBody2D

onready var global = get_node("/root/LoadScripts")




func _on_Area2D2_body_entered(body: Node) -> void:
	global.ball_life_state = 1
