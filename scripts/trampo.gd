extends Node2D

signal mesa_on
#@onready var mesinha : PackedScene = preload("uid://c4aafp744uhnm")
#@onready var node_mesinha : Node2D = mesinha.instantiate()
@onready var mesa: Node2D = %ZoomMesa
@onready var pause_menu: Control = %Pause_menu





var mouse_dentro_mesa := false
var ta_mesa := false
var dialogo:bool

func _ready() -> void:
	mesa.hide()
	Dialogic.connect("timeline_started",_on_dialogue_start)
	Dialogic.connect("timeline_ended",_on_dialogue_end)
	Dialogic.start("timeline_inicial")


func _process(_delta: float) -> void:
	#print(dialogo)
	pass

func _input(event: InputEvent) -> void:
	if dialogo == true:
		return
	if event.is_action_pressed("switch"):
		alternar_cena()


func alternar_cena() -> void:
	if !mesa.visible:
		mesa.show()
		mesa_on.emit(true)
	elif mesa.visible:
		mesa.hide()
		mesa_on.emit(false)

func _on_dialogue_start() -> void:
	dialogo = true

func _on_dialogue_end() -> void:
	dialogo = false
