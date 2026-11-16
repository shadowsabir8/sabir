extends RigidBody3D

@onready var camera = $"cam rig/Camera3D"
const rolling_force = 40

func _ready():
	camera.top_level = true

func _physics_process(delta):
	camera.global_transform.origin = global_transform.origin
	var dir = Vector3.ZERO
	
	if Input.is_action_pressed("ui_accept"):
		print("here")
	if Input.is_action_pressed("Forward"):
		dir.x = 1
		#angular_velocity.x -= rolling_force * delta
	elif Input.is_action_pressed("Down"):
		dir.x = -1
		#angular_velocity.x += rolling_force * delta
		
	if Input.is_action_pressed("Left"):
		dir.z = -1
		#angular_velocity.z += rolling_force * delta
	elif Input.is_action_pressed("Right"):
		dir.z = 1
		print("Right")
		#angular_velocity.z -= rolling_force * delta
	
	var roll = Vector3(dir.z, 0, dir.x)*rolling_force
	
	apply_torque(roll)
