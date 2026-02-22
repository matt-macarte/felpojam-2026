extends Area2D

@onready var escrita: Node2D = %Escrita

func _mouse_enter() -> void:
	if Input.is_action_just_pressed("interact"):
		escrita.visible = true
