extends Node2D

var rand_x
var rand_y
onready var global = get_node("/root/LoadScripts")


func _ready() -> void:
	randomize()
	for i in range(1200):
		var enemy = preload("res://Scenes/Enemy.tscn").instance()
		rand_x = rand_range(-10, 21265)
		rand_y = rand_range(600, -18250)
		enemy.global_position = Vector2(rand_x , rand_y)
		add_child(enemy)
	for i in range(600):
		var green_enemy = preload("res://Scenes/Green_Enemy.tscn").instance()
		rand_x = rand_range(0,21265)
		rand_y = rand_range(600, -18250)
		green_enemy.position = Vector2(rand_x , rand_y)
		add_child(green_enemy)

func _process(delta: float) -> void:
	pass
	
