extends CharacterBody3D

var SPEED:float = 0
const JUMP_VELOCITY:float = 400.0
@export var show_joystick:bool = false
@onready var grid_map = $"../Ground/GridMap";
@onready var joystick = $"../Mobile_UI"

@onready var camera_holder = $CameraHolder

var previous_position = Vector3()

func _ready() -> void:
	SPEED = Global.PLAYER_SPEED
	if(!show_joystick and joystick):
		joystick.queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		camera_holder.rotate_y(-event.relative.x * 0.01)

func _physics_process(delta: float) -> void:
	SPEED = Global.PLAYER_SPEED
	if(position.y <= -15):
		Global.load_scene_with_loading_screen("res://scenes/start_menu_screen.tscn")
		return
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if(show_joystick):
		var joystick_input = joystick.get_velocity(Vector3())
		var move_direction = Vector3.ZERO
		move_direction =  (joystick_input.z * camera_holder.global_transform.basis.z) + (joystick_input.x * camera_holder.global_transform.basis.x)
		velocity.z = move_direction.z * SPEED * delta
		velocity.x = move_direction.x * SPEED * delta
	else:
		
		var input_direction = Vector3.ZERO
		
		if(Input.is_action_pressed("forward")):
			input_direction.z = -1
		elif(Input.is_action_pressed("backward")):
			input_direction.z = 1
		else:
			input_direction.z = 0
		
		if(Input.is_action_pressed("left")):
			input_direction.x = -1
		elif(Input.is_action_pressed("right")):
			input_direction.x = 1
		else:
			input_direction.x = 0
	
		input_direction = input_direction.normalized();
		var forward = camera_holder.global_transform.basis.z
		var right = camera_holder.global_transform.basis.x
		
		var move_direction = (forward * input_direction.z) + (right * input_direction.x)
		move_direction.y = 0
		move_direction = move_direction.normalized()
		
		velocity.x = move_direction.x * SPEED * delta
		velocity.z = move_direction.z * SPEED * delta
	
	move_and_slide()
