extends Control

func _on_play_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/connections_screen.tscn")

func _on_shroom_gallery_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()