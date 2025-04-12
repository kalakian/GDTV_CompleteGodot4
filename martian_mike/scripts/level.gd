extends Node2D

@onready var start_position = $StartPosition

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func _on_deathzone_body_entered(body):
	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position
