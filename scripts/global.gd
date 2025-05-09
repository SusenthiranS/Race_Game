extends Node

var PLAYER_HEALTH:int = 100
var SPAWNED_ITEMS = 0
var PLAYER_POWERS_COLLECTION = 0
var PLAYER_SPEED:float = 300.0

var POWERS_TYPES = ["BOOST","SHIELD","LOUNCHER","JET","HEALTH"]

var POWERS_CATECAGRIES = {
	POWERS_TYPES[0]:Color.RED,
	POWERS_TYPES[1]:Color.BLUE,
	POWERS_TYPES[2]:Color.YELLOW,
	POWERS_TYPES[3]:Color.PURPLE,
	POWERS_TYPES[4]:Color.GREEN,
}

func change_player_speed_based_on_power(power:String) -> void:
	if(power==POWERS_TYPES[0]):
		PLAYER_SPEED = 800.0
	else:
		PLAYER_SPEED = 300.0

func load_scene_with_loading_screen(scene_path: String) -> void:
	var loading_screen = preload("res://scenes/loading_screen.tscn").instantiate()
	loading_screen.next_scene_path = scene_path
	get_tree().current_scene.add_child(loading_screen)
