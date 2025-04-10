extends Area2D

signal died

@export var speed = 200

func _physics_process(delta):
	global_position.x -= speed * delta


func die():
	died.emit()
	queue_free()


func _on_body_entered(body):
	body.take_damage()
	queue_free()
