extends CharacterBody2D

const SPEED = 450.0
@onready var paddle2 = $Sprite2D
@onready var game_manager = %GameManager

# sets default starting position of paddle
func _ready():
	var screen_size = get_viewport_rect().size
	position.y = screen_size.y / 2
	
func _physics_process(delta):
	# reset velocity at the start of physics loop
	velocity.y = 0
	# move paddle up or down
	if Input.is_action_pressed("w"):
		velocity.y -= SPEED
	if Input.is_action_pressed("s"):
		velocity.y += SPEED
	move_and_slide()

# update score for player when ball hits paddle
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "ball":
			game_manager.add_point2()
