extends CharacterBody2D

var speed = 300

func _physics_process(delta):
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
