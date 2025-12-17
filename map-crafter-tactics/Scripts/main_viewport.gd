extends Node3D

@onready var camera = $Camera3D
var preview_cube: MeshInstance3D = null

# Папка для созданных блоков
var blocks_parent: Node3D = null

func _ready():
	# Создаем полупрозрачный превью куб
	preview_cube = MeshInstance3D.new()
	preview_cube.mesh = BoxMesh.new()
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(1, 1, 1, 0.5)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	preview_cube.material_override = mat
	add_child(preview_cube)
	
	# Создаем родителя для блоков
	blocks_parent = Node3D.new()
	add_child(blocks_parent)

func _process(delta):
	# Считаем позицию курсора на плоскости y = 0
	var from = camera.project_ray_origin(get_viewport().get_mouse_position())
	var to = from + camera.project_ray_normal(get_viewport().get_mouse_position()) * 1000
	var t = -from.y / (to.y - from.y)
	var pos = from.lerp(to, t)
	
	# Привязываем к сетке
	pos.x = floor(pos.x + 0.5)
	pos.y = 0
	pos.z = floor(pos.z + 0.5)
	
	preview_cube.global_transform.origin = pos

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		place_block_at_cursor()

func place_block_at_cursor():
	# Берем текущую позицию превью
	var pos = preview_cube.global_transform.origin

	# Создаем новый блок
	var block = MeshInstance3D.new()
	block.mesh = BoxMesh.new()
	
	# Можно задать цвет случайный или один и тот же
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(0.7, 0.7, 0.7)  # серый
	block.material_override = mat
	
	block.global_transform.origin = pos
	blocks_parent.add_child(block)
