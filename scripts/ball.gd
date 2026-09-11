extends CharacterBody2D

const SPEED = 400.0
@onready var ball = $Sprite2D

# position the ball in the middle of the screen at the start
func _ready():
	var screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)

# the ball should speed up by 5% every bounce off a paddle
