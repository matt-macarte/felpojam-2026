extends Node2D
class_name Carta

@export var conteudo:RichTextLabel
@export var sprite_carta:AnimatedSprite2D

@export var carimbo_marca:AnimatedSprite2D

@onready var carta_fechada_box: CollisionShape2D = %carta_fechada_box
@onready var carta_aberta_box: CollisionShape2D = %carta_aberta_box

signal state_change(state)

var state:String = "fechada"
var carimbo_final

func _ready() -> void:
	conteudo.text = TextosCartas.carta_inicial
	connect("state_change", _on_stage_change)
	_on_stage_change()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and !PlayerStates.segurando:
		match state:
			"aberta": 
				state = "fechada"
				state_change.emit()
				return
			"fechada": 
				state = "aberta"
				state_change.emit()
				return

func _on_stage_change() -> void:
	if state == "aberta":
		sprite_carta.animation = "aberta"
		carta_aberta_box.disabled = false
		carta_fechada_box.disabled = true
		conteudo.visible = true
		carimbo_marca.visible = true
	elif state == "fechada":
		sprite_carta.animation = "fechada"
		carta_aberta_box.disabled = true
		carta_fechada_box.disabled = false
		conteudo.visible = false
		carimbo_marca.visible = false
