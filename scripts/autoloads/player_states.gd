extends Node


var segurando:bool



func _ready() -> void:
	segurando = false
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		segurando = false
		print("parou")
	pass

func _process(_delta: float) -> void:
	pass
