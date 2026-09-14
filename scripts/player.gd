extends StaticBody2D

var win_height : int
var p_height : int
@onready var player = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = player.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("arrow_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	if Input.is_action_pressed("arrow_down"):
		position.y += get_parent().PADDLE_SPEED * delta
