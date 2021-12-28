extends KinematicBody2D

var speed_x = 0
var gravity = 400
var ang_rad
var sca_swipe 
var strength
onready var global = get_node("/root/LoadScripts")
var can_click = true

func _ready() -> void:
	set_process(true)

func _process(delta: float) -> void:
	position += Vector2.DOWN * gravity * delta
	position += Vector2.RIGHT.rotated(rotation) * speed_x * delta
	sca_swipe = position.distance_to(get_global_mouse_position())
	if Input.is_action_pressed("Click") and can_click == true:
		ang_rad = position.angle_to_point(get_global_mouse_position())
		rotation = ang_rad 
	$Control/Sprite.scale.x = sca_swipe / 650
	strength = sca_swipe / 700
	if strength > 0.7 and Input.is_action_just_released("Click") and can_click == true :
		global.health -= 2
		speed_x = speed_x + 200
	move_and_slide(Vector2())
	if speed_x > 0 :
		speed_x -= 5
		gravity += 3
	if global.health  <= 0 :
		can_click = false
		Engine.time_scale = 1
		if Input.is_action_pressed("Click"):
			$Control/TouchScreenButton.emit_signal("released")
			$Control/TouchScreenButton.set_block_signals(true)
		if Input.is_action_pressed("Click"):
			can_click = false
			if Input.is_action_just_released("Click"):
				can_click = true
	else:
		$Control/TouchScreenButton.set_block_signals(false)
		can_click = true
	if global.ball_life_state == 1:
		speed_x = 0
		gravity = 0
		$Sprite_Ball.visible = false
		$CPUParticles2D.emitting = true
		yield(get_tree().create_timer(.35),"timeout")
		visible = false
		set_process(false)
		global.pause_state = true


func _on_TouchScreenButton_pressed() -> void:
	speed_x = 100
	gravity = 0
	Engine.time_scale = 0.5

func _on_TouchScreenButton_released() -> void:
	global.health -= 5
	speed_x += 1400
	gravity += 200
	Engine.time_scale = 1


func _on_Area2D_body_entered(_body: Node) -> void:
	global.health += 30

