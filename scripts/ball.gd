extends CharacterBody2D

const INIT_SPEED = 400.0
var speed = INIT_SPEED
var direction
@onready var ball = $Sprite2D

# position the ball in the middle of the screen at the start
func _ready():
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)
	direction = get_random_direction()

# the ball should speed up by 5% every bounce off a paddle
func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	
# random direction function
func get_random_direction() -> Vector2:
	var new_direction = Vector2()
	new_direction.x = [1, -1].pick_random()
	new_direction.y = randf_range(-1, 1)
	return new_direction.normalized()
	
