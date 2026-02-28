extends Node2D
class_name carta

@export var sprite:AnimatedSprite2D
@export var conteudo:RichTextLabel
@export var carta_fechada_box:CollisionShape2D

# se state == aberta
# colisao carta fechada. disable
# colisao carta aberta enable
var state

func _ready() -> void:
	conteudo.text = TextosCartas.carta_inicial
