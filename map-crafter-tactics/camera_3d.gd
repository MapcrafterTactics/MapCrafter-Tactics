extends Camera3D

@export var speed := 8.0
@export var rotation_speed := 90.0
@export var fixed_height := 0.0

func _ready():
	fixed_height = global_position.y

func _process(delta):
	var direction := Vector3.ZERO

	var forward := -global_transform.basis.z
	var right := global_transform.basis.x

	if Input.is_key_pressed(KEY_W):
		direction += forward
	if Input.is_key_pressed(KEY_S):
		direction -= forward
	if Input.is_key_pressed(KEY_A):
		direction -= right
	if Input.is_key_pressed(KEY_D):
		direction += right
	if Input.is_key_pressed(KEY_Q):
		rotation.y += deg_to_rad(rotation_speed) * delta
	if Input.is_key_pressed(KEY_E):
		rotation.y -= deg_to_rad(rotation_speed) * delta

	direction.y = 0
	direction = direction.normalized()
	global_position += direction * speed * delta
	global_position.y = fixed_height
