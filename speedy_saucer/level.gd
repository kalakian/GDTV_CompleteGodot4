extends Node2D

func _ready():
	pass


func _on_track_body_exited(body):
	get_tree().reload_current_scene()
