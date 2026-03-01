extends Node2D

@export var animation_player: AnimationPlayer


var p_mouse : Vector2


var sair = false

func _ready() -> void:
	animation_player.play_backwards("entrar")
	animation_player.pause()
	hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch"):
		if visible == true:
			hide()
		elif visible == false:
			show()

func _process(_delta: float) -> void:
	p_mouse = get_global_mouse_position()
