extends Control



func _on_TouchScreenButton_pressed() -> void:
	$Sprite.visible = true


func _on_TouchScreenButton_released() -> void:
	$Sprite.visible = false

