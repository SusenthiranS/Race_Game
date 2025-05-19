extends Node

var PLAYER_HEALTH:int = 100
var SPAWNED_ITEMS = 0
var PLAYER_POWERS_COLLECTION = []
var PLAYER_SPEED:float = 300.0

var POWERS_TYPE_NAMES = {
	"BOOST":"BOOST",
	"SHIELD":"SHIELD",
	"LOUNCHER":"LOUNCHER",
	"JET":"JET",
	"HEALTH":"HEALTH",
	"DAMAGE":"DAMAGE",
	}

var POWERS_TYPES = []

var POWERS_CATECAGRIES = {
	POWERS_TYPE_NAMES.BOOST:Color.RED,
	POWERS_TYPE_NAMES.SHIELD:Color.BLUE,
	POWERS_TYPE_NAMES.LOUNCHER:Color.YELLOW,
	POWERS_TYPE_NAMES.JET:Color.PURPLE,
	POWERS_TYPE_NAMES.HEALTH:Color.GREEN,
	POWERS_TYPE_NAMES.DAMAGE:Color.BLACK,
}

func _ready() -> void:
	for power_name in POWERS_TYPE_NAMES:
		POWERS_TYPES.push_back(power_name)

func load_scene_with_loading_screen(scene_path: String) -> void:
	var loading_screen = preload("res://scenes/loading_screen.tscn").instantiate()
	loading_screen.next_scene_path = scene_path
	get_tree().current_scene.add_child(loading_screen)
