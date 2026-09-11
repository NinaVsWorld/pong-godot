extends CharacterBody2D

const SPEED = 450.0
@onready var paddle1 = $Sprite2D
	
func _physics_process(delta):
	# reset velocity at the start of physics loop
	velocity.y = 0
	# move paddle up or down
	if Input.is_action_pressed("arrow_up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("arrow_down"):
		velocity.y += SPEED
	move_and_slide()
