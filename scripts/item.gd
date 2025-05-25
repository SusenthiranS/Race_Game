extends Area3D

@onready var screen_ui = $"../../screen_ui"
@export var power_type = ""

func _on_body_entered(_body: Node3D) -> void:
	
	if(power_type==Global.POWERS_TYPE_NAMES.HEALTH or power_type==Global.POWERS_TYPE_NAMES.DAMAGE):
		change_player_speed_based_on_power(power_type)
	
	Global.SPAWNED_ITEMS -= 1
	queue_free()
	if(Global.PLAYER_POWERS_COLLECTION.size() <= 3):
		if(power_type!=Global.POWERS_TYPE_NAMES.HEALTH and power_type!=Global.POWERS_TYPE_NAMES.DAMAGE):
			if power_type not in Global.PLAYER_POWERS_COLLECTION:
				Global.PLAYER_POWERS_COLLECTION.push_back(power_type)
		
		if(screen_ui):
			screen_ui.update_screen_ui()

func change_player_speed_based_on_power(power:String) -> void:
	if(power==Global.POWERS_TYPE_NAMES.BOOST):
		Global.PLAYER_SPEED = 400.0
	elif(power==Global.POWERS_TYPE_NAMES.JET):
		Global.PLAYER_SPEED = 800.0
	elif(power==Global.POWERS_TYPE_NAMES.HEALTH and Global.PLAYER_HEALTH<100):
		Global.PLAYER_HEALTH += 10
		screen_ui.update_screen_ui()
	elif(power==Global.POWERS_TYPE_NAMES.DAMAGE and Global.PLAYER_HEALTH>0):
		Global.PLAYER_HEALTH -= 10
		screen_ui.update_screen_ui()
	#else:
		#Global.PLAYER_SPEED = 300.0
