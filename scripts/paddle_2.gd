extends StaticBody2D

const SPEED = 450.0
@onready var paddle2 = $Sprite2D
@onready var game_manager = %GameManager

# sets default starting position of paddle
func _ready():
	var screen_size = get_viewport_rect().size
	position.y = screen_size.y / 2
	
func _physics_process(delta):
	# move paddle up or down
	if Input.is_action_pressed("w"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("s"):
		position.y += SPEED * delta
