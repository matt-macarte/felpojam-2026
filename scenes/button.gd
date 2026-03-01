extends Button

@onready var carta: Carta = $"../../Mesa/Carta"

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if carta.carimbo_marca.animation != "null":
		visible = true



func _on_pressed() -> void:
	SceneLoader.load_scene("uid://c68rp61e3s6di")
	pass # Replace with function body.
