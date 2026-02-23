extends Node2D

@onready var mesinha : PackedScene = preload("uid://c4aafp744uhnm")
@onready var node_mesinha : Node2D = mesinha.instantiate()
@onready var animacao : AnimationPlayer = node_mesinha.get_child(1)


func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("cancel"):
		if node_mesinha.get_parent():
			animacao.play_backwards()
			await node_mesinha.animation_player.animation_finished
			remove_child(node_mesinha)
		else:
			add_child(node_mesinha)
