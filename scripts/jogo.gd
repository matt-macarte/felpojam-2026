extends Node

@onready var start_menu = load("res://scenes/start_menu.tscn").instantiate()
@onready var gui: Control = %GUI


func _ready() -> void:
	#start_menu.instantiate()
	gui.get_tree().change_scene_to_node(start_menu)
