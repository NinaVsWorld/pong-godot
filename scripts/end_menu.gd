extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_home_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
