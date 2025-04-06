extends CharacterBody2D

@export var speed = 300
@export var rocket_offset = 80
@export var firing_delay = 0.5 #seconds

var time_since_fired = 0

@export var rocket_scene : PackedScene

@onready var rocket_container = $RocketContainer

func _process(delta):
	time_since_fired += delta
	if Input.is_action_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2.ZERO, screen_size)

func shoot():
	if time_since_fired >= firing_delay:
		var rocket_instance = rocket_scene.instantiate()
		rocket_container.add_child(rocket_instance)
		
		rocket_instance.global_position = global_position
		rocket_instance.global_position.x += rocket_offset
		
		time_since_fired = 0
