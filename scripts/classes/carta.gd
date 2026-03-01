extends Node2D
class_name Carta

@export var conteudo:RichTextLabel
@export var sprite_carta:AnimatedSprite2D
@export var area:Area2D

@export var carimbo_marca:AnimatedSprite2D

@onready var carta_fechada_box: CollisionShape2D = %carta_fechada_box
@onready var carta_aberta_box: CollisionShape2D = %carta_aberta_box

signal state_change(state)

var state:String = "fechada"
var carimbo_visivel:bool
var entrou:bool
var pegou:bool

func _ready() -> void:
	conteudo.text = TextosCartas.carta_inicial
	conteudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	#if carimbo:
		#carimbo.connect("carimbar", _on_carimbar)
	area.connect("mouse_entered", _on_mouse_entered)
	area.connect("mouse_exited", _on_mouse_exited)
	connect("state_change", _on_stage_change)
	_on_stage_change()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact2") and entrou and !PlayerStates.segurando:
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


func _on_mouse_entered() -> void:
	entrou = true
func _on_mouse_exited() -> void:
	entrou = false

func carimbar(tipo:String, posicao:Vector2) -> void:
	print("carimbou")
	if entrou:
		carimbo_marca.animation = tipo
		carimbo_marca.global_position = posicao

func _on_carimbo_carimbar(tipo: Variant, posicao: Variant) -> void:
	carimbar(tipo, posicao)


func _on_carimbo_2_carimbar(tipo: Variant, posicao: Variant) -> void:
	carimbar(tipo, posicao)


func _on_carimbo_3_carimbar(tipo: Variant, posicao: Variant) -> void:
	carimbar(tipo, posicao)


func _on_carimbo_4_carimbar(tipo: Variant, posicao: Variant) -> void:
	carimbar(tipo, posicao)


func _on_grab_pegou_item() -> void:
	pegou = true


func _on_grab_largou_item() -> void:
	pegou = false
