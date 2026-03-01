extends Node2D
class_name Carimbo

@export var carta:Carta

@export var sprite:AnimatedSprite2D
@export var carimbar_box:Area2D
@export var grab:Grab
@export var tipo:String

var pegou:bool

signal carimbar(tipo,global_position)

func _ready() -> void:
	grab.connect("pegou_item", _on_pegou_item)
	grab.connect("largou_item", _on_largou_item)
	definir_carimbo()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and pegou == true:
		carimbar.emit()
		print("clicou")

func definir_carimbo() -> void:
	match tipo:
		"aversao":
			sprite.animation = "aversao"
			return
		"desalento":
			sprite.animation = "desalento"
			return
		"desejo":
			sprite.animation = "desejo"
			return
		"esperanca":
			sprite.animation = "esperanca"
			return

func _on_pegou_item() -> void:
	pegou = true
func _on_largou_item() -> void:
	pegou = false
