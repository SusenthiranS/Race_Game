extends CanvasLayer

@onready var anology = $"Control/Virtual Joystick"
signal button_pressed(type)

func get_velocity(vector_type):
	#return anology.output
	return anology.get_velocity(vector_type)



func _on_button_2_pressed() -> void:
	button_pressed.emit("jump")


func _on_button_pressed() -> void:
	button_pressed.emit("torch")
