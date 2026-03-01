extends Node

@onready var mesa: Node2D = %Mesa
@onready var trampo: Node2D = %Trampo
@onready var pause_menu: Control = %Pause_menu

var dialogo:bool

func _ready() -> void:
	Dialogic.connect("timeline_started", _on_dialogue_start)
	Dialogic.connect("timeline_ended", _on_dialogue_end)
	mesa.hide()
	SoundManager.musica_jogo()
	Dialogic.start("timeline_inicial")

func _on_dialogue_start() -> void:
	dialogo = true
func _on_dialogue_end() -> void:
	dialogo = false
