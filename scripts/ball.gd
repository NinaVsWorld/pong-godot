extends CharacterBody2D

const INIT_SPEED = 250.0
# max angle ball can bounce off of paddle
const MAX_Y_VECTOR = 0.5
var speed = INIT_SPEED
var direction
@onready var ball = $Sprite2D

# position the ball in the middle of the screen at the start
func _ready():
	reset_ball()
	direction = get_random_direction()

# the ball should speed up by 5% every bounce off a paddle
func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		# if collision is on wall, set the ball back to centre
		var collider = collision.get_collider()
		
		# if ball hits paddles
		if collider.name == "paddle1" or collider.name == "paddle2":
			speed = speed * 1.05
			direction = new_direction(collider)
		# if ball bounces off walls, normal bounce
		else:
			direction = direction.bounce(collision.get_normal())

	
# random direction function
func get_random_direction() -> Vector2:
	var new_direction = Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()

# new direction
func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir = Vector2()
	var collision_shape = collider.get_node_or_null("CollisionShape2D")
	var shape = collision_shape.shape
		
	# flip the horizontal direction when ball hits paddle
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (shape.size.y / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
	
func reset_ball():
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)
	direction = get_random_direction()
