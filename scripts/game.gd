extends Node2D

@onready var game_manager = %GameManager
@onready var ball = $GameObjects/ball
@onready var canvas_layer = $CanvasLayer

func _ready():
	ball.point_scored.connect(scored)
	canvas_layer.hide()

func scored(paddle : String):
	if paddle == "paddle1":
		game_manager.add_point1()
	if paddle == "paddle2":
		game_manager.add_point2()
		

func _process(delta):
	game_over()
	
func game_over():
	if game_manager.get_player1_score() >= 15 or game_manager.get_player2_score() >= 15:
		get_tree().paused = true
		canvas_layer.show()
