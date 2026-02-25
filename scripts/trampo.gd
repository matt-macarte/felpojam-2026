extends Node2D


@onready var mesinha : PackedScene = preload("uid://c4aafp744uhnm")
#@onready var node_mesinha : Node2D = mesinha.instantiate()
@onready var zoom_mesa: Node2D = %ZoomMesa


@onready var area_mesa: Area2D = $AreaMesa
@onready var bruxa_mes: Area2D = $BruxaMes
@onready var cartazes: Area2D = $Cartazes
@onready var coisinha: Area2D = $Coisinha


var mouse_dentro_mesa := false
var ta_mesa := false

func _ready() -> void:
	zoom_mesa.visible = false
	Dialogic.start('timeline_inicial')

func _process(_delta: float) -> void:
	desativar_interacoes()
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and mouse_dentro_mesa:
		if ta_mesa == false:
			ta_mesa = true
			zoom_mesa.visible = true
	if event.is_action_pressed("cancel") and ta_mesa == true:
		zoom_mesa.visible = false
		ta_mesa = false

func desativar_interacoes() -> void:
	area_mesa.visible = !ta_mesa
	bruxa_mes.visible = false
	cartazes.visible = false
	coisinha.visible = !ta_mesa


func _on_area_mesa_mouse_entered() -> void:
	area_mesa.modulate = Color(1,1,1,0.2)
	mouse_dentro_mesa = true
	print("entrou")
func _on_area_mesa_mouse_exited() -> void:
	area_mesa.modulate = Color(1,1,1,0)
	mouse_dentro_mesa = false


func _on_bruxa_mes_mouse_entered() -> void:
	bruxa_mes.modulate = Color(1,1,1,1)
func _on_bruxa_mes_mouse_exited() -> void:
	bruxa_mes.modulate = Color(1,1,1,0)


func _on_cartazes_mouse_entered() -> void:
	cartazes.modulate = Color(1,1,1,1)
func _on_cartazes_mouse_exited() -> void:
	cartazes.modulate = Color(1,1,1,0)
