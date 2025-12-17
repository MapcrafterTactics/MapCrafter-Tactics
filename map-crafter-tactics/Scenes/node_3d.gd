extends Node3D

func _process(_delta):
	# Показываем сетку только если выбран блок
	visible = BuildManager.current_block_id != ""
