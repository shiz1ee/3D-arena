extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.5
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.5
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x, -80.0, 80.0
		)
	elif event.is_action_pressed("Esc"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta: float):
	var input_direction_2D = Input.get_vector(
		 "move_left", "move_right","move_forward","move_back"
	)
