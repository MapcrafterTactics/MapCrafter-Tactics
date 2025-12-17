extends Control

@onready var button1 = $PanelContainer/VBoxContainer/Button
@onready var button2 = $PanelContainer/VBoxContainer/Button2
@onready var button3 = $PanelContainer/VBoxContainer/Button3

@onready var side_panel1 = $Panel
@onready var side_panel2 = $Panel2
@onready var side_panel3 = $Panel3

func _ready():
	# изначально видна только первая панель
	side_panel1.visible = true
	side_panel2.visible = false
	side_panel3.visible = false
	
	button1.pressed.connect(func(): _show_panel(1))
	button2.pressed.connect(func(): _show_panel(2))
	button3.pressed.connect(func(): _show_panel(3))

func _show_panel(panel_number):
	side_panel1.visible = panel_number == 1
	side_panel2.visible = panel_number == 2
	side_panel3.visible = panel_number == 3
