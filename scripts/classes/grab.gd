class_name Grab
extends Node

@export var node2d:Node2D
@export var grab_box:Area2D

var pode_pegar:bool = false
var offset:Vector2
var pegou:bool = false
var interactable_obj:Node2D

var sfx_path: = preload("uid://d2m37wxn4p338")
var sfx:AudioStreamPlayer = AudioStreamPlayer.new()


func _ready() -> void:
	sfx.bus = "SFX"
	sfx.stream = sfx_path
	add_child(sfx)
	grab_box.connect("mouse_entered", _on_mouse_entered)
	grab_box.connect("mouse_exited", _on_mouse_exited)


func _process(_delta: float) -> void:
	
	if pegou == true:
		pegar()
	if PlayerStates.segurando == false:
		pegou = false


func _input(event: InputEvent) -> void:
	if pode_pegar == true and event.is_action_pressed("interact"):
		set_mouse_pos()
		if pegou == false and PlayerStates.segurando == false:
			pegou = true
			sfx.play()
			PlayerStates.segurando = true
		elif pegou == true:
			pegou = false
			PlayerStates.segurando = false


func _on_mouse_entered() -> void:
	pode_pegar = true
func _on_mouse_exited() -> void:
	pode_pegar = false

func pegar() -> void:
	node2d.position = node2d.get_global_mouse_position() - offset

func set_mouse_pos() -> void:
	offset = node2d.get_global_mouse_position() - grab_box.global_position
