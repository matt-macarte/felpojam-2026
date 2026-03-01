extends Node
class_name Pop

@export var collision:Area2D
@export var scale_to:float = 1.2
@export var object:AnimatedSprite2D

var mouse:bool = false
var scaled_size:Vector2 
var scale_initial:Vector2 

func _ready() -> void:
	scaled_size = object.scale * scale_to
	scale_initial = object.scale
	collision.connect("mouse_entered", _on_mouse_entered)
	collision.connect("mouse_exited", _on_mouse_exited)

func _process(delta: float) -> void:
	if PlayerStates.segurando:
		object.scale = scale_initial


func _on_mouse_entered() -> void:
	if PlayerStates.segurando == false:
		object.scale = scaled_size
func _on_mouse_exited() -> void:
	if PlayerStates.segurando == false:
		object.scale = scale_initial
