extends Camera3D

# Basic mouse and keyboard movement

var rot_x:float = 0
var rot_y:float = 0

@export
var move_speed:float = 20.0

const LOOKAROUND_SPEED:float = 0.005

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#func _process(delta):
	# Move the camera based on the key pressed
	#if Input.is_action_pressed("left"):
		#translate(Vector3.LEFT * delta * move_speed)
	#if Input.is_action_pressed("right"):
		#translate(Vector3.RIGHT * delta * move_speed)
	#if Input.is_action_pressed("forward"):
		#translate(Vector3.FORWARD * delta * move_speed)
	#if Input.is_action_pressed("backward"):
		#translate(-Vector3.FORWARD * delta * move_speed)


func _input(event):
	if event is InputEventKey:
		if event.is_action_released("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().quit()
	
	if event is InputEventMouseButton:
		if (event as InputEventMouseButton).button_index == 2:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		#if (event as InputEventMouseButton).button_index == 1:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	#if event is InputEventKey:
		#if (event as InputEventKey).keycode == InputEventKey.new().
	#if event is InputEventMouseMotion:
		#rot_x -= event.relative.x * LOOKAROUND_SPEED
		#rot_y -= event.relative.y * LOOKAROUND_SPEED
#
		#transform.basis = Basis()
#
		#rotate_object_local(Vector3(0, 1, 0), rot_x)
		#rotate_object_local(Vector3(1, 0, 0), rot_y)
#
	#el
