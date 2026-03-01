extends Node
class_name Pop

@export var collision:Area2D
@export var scale_to:float = 1.2
@export var object:AnimatedSprite2D

var mouse:bool = false

func _ready() -> void:
	collision.connect("mouse_entered", _on_mouse_entered)
	collision.connect("mouse_exited", _on_mouse_exited)



func _on_mouse_entered() -> void:
	if PlayerStates.segurando == false:
		object.scale *= scale_to
func _on_mouse_exited() -> void:
	if PlayerStates.segurando == false:
		object.scale /= scale_to
