extends Area2D

@export var speed = 500

@onready var visible_notifier = $VisibleNotifier

func _ready():
	visible_notifier.screen_exited.connect(_on_screen_exited)


func _physics_process(delta):
	global_position.x += speed * delta


func _on_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
