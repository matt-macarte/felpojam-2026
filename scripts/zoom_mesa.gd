extends Node2D

@export var animation_player: AnimationPlayer
@onready var carta: Area2D = %carta
@onready var cera: Area2D = %cera
@onready var fogo: Area2D = %fogo
@onready var colher: Area2D = %colher
@onready var carimbador: Area2D = %carimbador

var p_mouse : Vector2

var item :Dictionary = {"limpar":0,"carta":carta, "cera":cera, "colher":colher}
var mover_item : String

var sair = false

func _ready() -> void:
	animation_player.play_backwards("entrar")
	animation_player.pause()
	mover_item = "limpar"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and mover_item != "limpar":
		print("clicou: ", mover_item)
		#item[mover_item].position = get_global_mouse_position()

func _process(_delta: float) -> void:
	p_mouse = get_global_mouse_position()
	print(mover_item)


func _on_carta_mouse_entered() -> void:
	mover_item = "carta"
func _on_carta_mouse_exited() -> void:
	mover_item = "limpar"


func _on_cera_mouse_entered() -> void:
	pass
func _on_cera_mouse_exited() -> void:
	pass


func _on_colher_mouse_entered() -> void:
	mover_item = "colher"
func _on_colher_mouse_exited() -> void:
	mover_item = "limpar"


func _on_carimbador_mouse_shape_entered(shape_idx: int) -> void:
	mover_item = "carimbador"
func _on_carimbador_mouse_exited() -> void:
	mover_item = "limpar"
