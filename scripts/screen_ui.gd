extends CanvasLayer

@onready var player_health_bar = $Control/Control/ProgressBar
@onready var player_powers_list = $Control/Control/HBoxContainer

func _ready() -> void:
	update_screen_ui()

func update_screen_ui():
	player_health_bar.value = Global.PLAYER_HEALTH
	update_powers_list()
	
func update_powers_list():
	
	var display_powers = []
	
	for power in Global.PLAYER_POWERS_COLLECTION:
		display_powers.push_front(power)
		for displayed_power in player_powers_list.get_children():
			if(displayed_power.name == power):
				display_powers.erase(power)
	
	for power in display_powers:
		var power_icon = TextureRect.new()
		power_icon.texture = preload("res://icon.svg")
		power_icon.name = power
		power_icon.expand_mode = power_icon.EXPAND_FIT_WIDTH
		power_icon.modulate = Global.POWERS_CATECAGRIES[power]
		player_powers_list.add_child(power_icon)
