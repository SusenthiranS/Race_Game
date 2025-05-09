extends CanvasLayer

@onready var player_health_bar = $Control/Control/ProgressBar
@onready var player_powers = $Control/Control/Label
@onready var player_powers_list = $Control/Control/HBoxContainer
func _ready() -> void:
	update_screen_ui()

func update_screen_ui():
	player_health_bar.value = Global.PLAYER_HEALTH
	player_powers.text = str(Global.PLAYER_POWERS_COLLECTION)
