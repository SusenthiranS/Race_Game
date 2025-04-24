extends Sprite2D

@onready var anolog = $"../anolog"
@onready var anolog_outline = $"../TouchScreenButton"

var joystick_active: bool = false
var max_length = 100
var deadzone_size = 10

func _process(_delta):
	if joystick_active:
		var relative_position = get_local_mouse_position()
		print(relative_position)
		var distance = relative_position.distance_to(anolog_outline.position)
		if distance <= max_length:
			_move_tip(relative_position)
		else:
			anolog.position = anolog_outline.position + (relative_position - anolog_outline.position).normalized() * max_length
	else:
		reset_joystick()

func _move_base(new_position: Vector2) -> void:
	anolog_outline.global_position = new_position - anolog_outline.pivot_offset * get_global_transform_with_canvas().get_scale()

func _move_tip(new_position: Vector2) -> void:
	anolog.global_position = new_position - anolog.pivot_offset * anolog_outline.get_global_transform_with_canvas().get_scale()
	

func get_velocity(vector_type):
	var velocity = null
	if vector_type is Vector2:
		velocity = Vector2(0, 0)
		velocity.x = anolog.position.x / max_length
		velocity.y = anolog.position.y / max_length
	else:
		velocity = Vector3()
		velocity.x = anolog.position.x / max_length
		velocity.z = anolog.position.y / max_length
		
	return velocity


func reset_joystick():
	joystick_active = false


func _on_touch_screen_button_pressed() -> void:
	print("pressed");
	joystick_active = true

func _on_touch_screen_button_released() -> void:
	reset_joystick()
