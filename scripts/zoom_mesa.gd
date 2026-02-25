extends Node2D

@export var animation_player: AnimationPlayer

var sair = false

func _ready() -> void:
	animation_player.play_backwards("entrar")
	animation_player.pause()
	pass
	#await animation_player.animation_finished
