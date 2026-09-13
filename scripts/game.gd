extends Node2D

@onready var game_manager = %GameManager
@onready var ball = $GameObjects/ball
@onready var end_menu = $EndMenu

func _ready():
	ball.point_scored.connect(scored)
	end_menu.hide()

func scored(paddle : String):
	if paddle == "paddle1":
		game_manager.add_point1()
	if paddle == "paddle2":
		game_manager.add_point2()
		
func _process(delta):
	game_over()
	
func game_over():
	if game_manager.get_player1_score() >= 1 or game_manager.get_player2_score() >= 15:
		get_tree().paused = true
		end_menu.show()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_home_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
