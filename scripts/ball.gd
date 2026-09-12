extends RigidBody2D

const INIT_SPEED = 400.0
# max angle ball can bounce off of paddle
const MAX_Y_VECTOR = 0.5
var speed = INIT_SPEED
var direction

# position the ball in the middle of the screen at the start
func _ready():
	reset_ball()
	direction = get_random_direction()

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
		elif collider.name == "ScreenBoundaries":
			# get the shape index
			var shape_index = collision.get_collider_shape_index()
			# get the shape owner id
			var shape_owner_id = collider.shape_find_owner(shape_index)
			# get the actual shape
			var hit_shape = collider.shape_owner_get_owner(shape_owner_id)
			if hit_shape.name == "Bottom" or hit_shape.name == "Top":
				direction = direction.bounce(collision.get_normal())
			else:
				# delay the reset
				await get_tree().create_timer(1).timeout
				reset_ball()
	
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
	speed = INIT_SPEED
