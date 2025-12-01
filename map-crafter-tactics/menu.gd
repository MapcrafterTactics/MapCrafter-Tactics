extends Control

func _ready():
	$ButtonsContainer/ExitButton.pressed.connect(_on_exit_pressed)

func _on_exit_pressed():
	get_tree().quit()
