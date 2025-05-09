extends Area3D

@onready var screen_ui = $"../../screen_ui"
@export var power_type = ""

func _on_body_entered(_body: Node3D) -> void:
	
	Global.change_player_speed_based_on_power(power_type)
	Global.SPAWNED_ITEMS -= 1
	queue_free()
	if(Global.PLAYER_POWERS_COLLECTION <= 3):
		Global.PLAYER_POWERS_COLLECTION += 1
		if(screen_ui):
			screen_ui.update_screen_ui()
