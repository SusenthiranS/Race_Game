extends Control

func _on_start_btn_pressed() -> void:
	Global.load_scene_with_loading_screen("res://scenes/start_point.tscn")
	return

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
