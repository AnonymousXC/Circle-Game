extends Node2D


func _ready() -> void:
	$Label.visible = false

func _on_Button_pressed() -> void:
	$Label.visible = true
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene_to(load("res://Scenes/Main.tscn"))


func _on_Button3_pressed() -> void:
	get_tree().quit()
