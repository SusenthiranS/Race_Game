extends CanvasLayer

@onready var player_health_bar = $Control/Control/ProgressBar
@onready var player_powers_list = $Control/Control/HBoxContainer

func _ready() -> void:
	Global.set_screen_ui(self)
	update_screen_ui()

func update_screen_ui():
	player_health_bar.value = Global.PLAYER_HEALTH
	update_powers_list()
	
func update_powers_list():
	
	# Remove icons that are no longer valid
	for child in player_powers_list.get_children():
		if child.name not in Global.PLAYER_POWERS_COLLECTION:
			player_powers_list.remove_child(child)
			child.queue_free()  # Free the node from memory
	
	# this remove the duplicate
	var existing_power_list = player_powers_list.get_children().map(func(child): return child.name)
	
	for power in Global.PLAYER_POWERS_COLLECTION:
		if power not in existing_power_list:
			var power_icon = TextureRect.new()
			power_icon.texture = preload("res://icon.svg")
			power_icon.name = power
			power_icon.expand_mode = power_icon.EXPAND_FIT_WIDTH
			power_icon.modulate = Global.POWERS_CATECAGRIES[power]
			player_powers_list.add_child(power_icon)
