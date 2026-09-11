extends CharacterBody2D

const SPEED = 450.0
@onready var paddle2 = $Sprite2D

func _physics_process(delta):
	# reset velocity at the start of physics loop
	velocity.y = 0
	# move paddle up or down
	if Input.is_action_pressed("w"):
		velocity.y -= SPEED
	if Input.is_action_pressed("s"):
		velocity.y += SPEED
	move_and_slide()
