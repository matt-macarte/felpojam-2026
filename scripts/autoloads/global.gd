extends Node

# cenas
##################################

const uid:Dictionary = {
	"trampo": "uid://di4r6ivm6cuwi",
	"menu_inicial": "uid://cgcgktwmn5n18",
	"mesa": "uid://c4aafp744uhnm",
	"pause": "uid://c737ql4in1ow7",
	"tela_final": null,
	
}

var menu_inicial:Dictionary = {
	"uid": uid["menu_inicial"],
	"node": preload(uid["menu_inicial"]).instantiate(),
	"packedscene": preload(uid["menu_inicial"]),
}

var trampo:Dictionary = {
	"uid": uid["trampo"],
	"node": preload(uid["trampo"]).instantiate(),
	"packedscene": preload(uid["trampo"]),
}

var mesa:Dictionary = {
	"uid": uid["mesa"],
	"node": preload(uid["mesa"]).instantiate(),
	"packedscene": preload(uid["mesa"]),
}

var pause:Dictionary = {
	"uid": uid["pause"],
	"node": preload(uid["pause"]).instantiate(),
	"packedscene": preload(uid["pause"]).instantiate(),
}

var final:Dictionary = {
	"uid": null,
	"node": null,
	"packedscene": null,
}
# fim cenas
#############################################################

var transition_style = "black"
var game_start:bool = false
var dia_atual:int = 0

var start_menu = preload("uid://cgcgktwmn5n18").instantiate()
var pause_menu = preload("uid://c737ql4in1ow7").instantiate()


func _ready() -> void:
	pass


func _on_game_start() -> void:
	add_sibling(pause_menu)
	SoundManager.musica_jogo()
