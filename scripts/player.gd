extends CharacterBody3D

const SPEED:float = 300.0
const JUMP_VELOCITY:float = 400.0
@export var show_joystick:bool = false

@onready var joystick = $"../Mobile_UI"

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	
	if(show_joystick):
		velocity.z = joystick.get_velocity(Vector3()).z * SPEED * delta
		velocity.x = joystick.get_velocity(Vector3()).x * SPEED * delta
	else:
		if(joystick):
			joystick.queue_free()
		if(Input.is_action_pressed("forward")):
			velocity.z = -1 * SPEED * delta
		elif(Input.is_action_pressed("backward")):
			velocity.z = SPEED * delta
		else:
			velocity.z = 0
		
		if(Input.is_action_pressed("left")):
			velocity.x = -1 *  SPEED * delta
		elif(Input.is_action_pressed("right")):
			velocity.x = SPEED * delta
		else:
			velocity.x = 0
	
	move_and_slide()
