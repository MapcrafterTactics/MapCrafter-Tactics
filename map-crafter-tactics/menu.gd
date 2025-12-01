extends Control

func _ready():
	$ButtonsContainer/NewSceneButton.pressed.connect(_on_new_scene_pressed)
	$ButtonsContainer/LoadSceneButton.pressed.connect(_on_load_scene_pressed)
	$ButtonsContainer/SettingsButton.pressed.connect(_on_settings_pressed)
	$ButtonsContainer/ExitButton.pressed.connect(_on_exit_pressed)
	
func _on_new_scene_pressed():
	get_tree().change_scene_to_file("res://Editor.tscn")

func _on_load_scene_pressed():
	get_tree().change_scene_to_file("res://Saved scenes.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Settings.tscn")

func _on_exit_pressed():
	get_tree().quit()
