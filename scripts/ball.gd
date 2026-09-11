extends CharacterBody2D

const INIT_SPEED = 250.0
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
		
		# if the ball hits walls
		if collider.name == "ScreenBoundaries":
			# get the shape index
			var shape_index = collision.get_collider_shape_index()
			
			# get the shape owner id
			var shape_owner_id = collider.shape_find_owner(shape_index)
			
			# get the actual
			var hit_shape = collider.shape_owner_get_owner(shape_owner_id)
			
			if hit_shape.name == "Right" or hit_shape.name == "Left":
				reset_ball()
			else:
				direction = direction.bounce(collision.get_normal())
		# if the ball hits paddles, it should bounce in the other direction
		else:
			direction = direction.bounce(collision.get_normal())
			speed = speed * 1.05
		
	
# random direction function
func get_random_direction() -> Vector2:
	var new_direction = Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()

func reset_ball():
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)
	direction = get_random_direction()
