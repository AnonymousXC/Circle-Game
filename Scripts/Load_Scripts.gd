extends Node2D


var health = 100
var ball_life_state = 0
var pause_state = false
var score = 0

func _process(_delta: float) -> void:
	if health < 0:
		health = 0
	if health > 100 :
		health = 100
	yield(get_tree().create_timer(1),("timeout"))
	health -= .4
