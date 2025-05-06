extends Node

var HEALTH:int = 100
var SPAWNED_ITEMS = 0


func load_scene_with_loading_screen(scene_path: String) -> void:
	var loading_screen = preload("res://scenes/loading_screen.tscn").instantiate()
	loading_screen.next_scene_path = scene_path
	get_tree().current_scene.add_child(loading_screen)
