extends CharacterBody2D

@export var gravity = 400
@export var max_fall_speed = 500
@export var jump_force = 200
@export var speed = 125

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_force
	else:
		velocity.y += gravity * delta
		if velocity.y > max_fall_speed:
			velocity.y = max_fall_speed
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()
