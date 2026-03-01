extends Node2D
class_name Carimbo

@export var sprite:AnimatedSprite2D
@export var carimbar_box:Area2D
@export var carta:Carta
@export var tipo:String

signal carimbar(tipo)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and carta.state == "aberta":
		carimbar.emit()

func definir_carimbo() -> void:
	match tipo:
		"aversao":
			sprite.animation = "aversao"
			pass
		"desalento":
			sprite.animation = "desalento"
			pass
		"desejo":
			sprite.animation = "desejo"
			pass
		"esperanca":
			sprite.animation = "esperanca"
			pass
