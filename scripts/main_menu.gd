extends Control
@onready var instructions = $Instructions

func _ready():
	instructions.hide()
	
func _on_classic_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_computer_pressed():
	pass # Replace with function body.

func _on_instructions_pressed():
	instructions.show()

func _on_close_pressed():
	instructions.hide()
