extends Node2D

@onready var player = $Player
@onready var start_position = $StartPosition

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_deathzone_body_entered(body):
	if body is Player:
		reset_player()


func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start_position.global_position


func _on_trap_touched_player():
	reset_player()
