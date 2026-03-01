extends Node2D

@onready var coisinha_moods: AnimatedSprite2D = %CoisinhaMoods
var mouse_dentro: bool = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and mouse_dentro:
		mudar_sprite()


func mudar_sprite() -> void:
	match coisinha_moods.animation:
		"default":
			coisinha_moods.animation = "feliz"
			return
		"feliz":
			coisinha_moods.animation = "suando"
			return
		"suando":
			coisinha_moods.animation = "morrendo"
			return
		"morrendo":
			coisinha_moods.animation = "default"
			return


func _on_interact_box_mouse_entered() -> void:
	mouse_dentro = true

func _on_interact_box_mouse_exited() -> void:
	mouse_dentro = false
