extends KinematicBody2D

onready var global = get_node("/root/LoadScripts")

func _on_Area2D_body_entered(_body: Node) -> void:
	global.health += 30
	global.score += 100
	$CPUParticles2D.emitting = true
	print(global.health)
	yield(get_tree().create_timer(.25), "timeout")
	queue_free()

