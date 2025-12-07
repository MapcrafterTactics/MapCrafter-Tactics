extends Control

@onready var buttons_panel = $PanelContainer
@onready var buttons_box = $PanelContainer/VBoxContainer
@onready var side_panel = $Panel

var shift_distance = 160

func _ready():
	for element in buttons_box.get_children():
		if element is Button:
			element.pressed.connect(_on_any_button_pressed)

func _on_any_button_pressed():
	var tween = create_tween()
	tween.set_parallel(true)


	tween.tween_property(
		buttons_panel,
		"position",
		buttons_panel.position + Vector2(shift_distance, 0),
		0.4
	)

	tween.tween_property(
		side_panel,
		"position",
		side_panel.position + Vector2(shift_distance, 0),
		0.4
	)
