extends CanvasLayer

signal loading_screen_ready

@export var animation_player: AnimationPlayer

@onready var black: Panel = %Black
@onready var light: Panel = %Light
@onready var purple: Panel = %Purple

var usar: String = Global.transition_style

func _ready() -> void:
	wich_animation()
	animation_player.play("transition")
	await animation_player.animation_finished
	loading_screen_ready.emit()
	

func _on_progress_changed(_new_value: float) -> void:
	pass

func _on_load_finished() -> void:
	animation_player.play_backwards("transition")
	await animation_player.animation_finished
	queue_free()

func wich_animation() -> void:
	if usar == "black":
		black.visible = true
	elif usar == "light":
		light.visible = true
	elif usar == "purple":
		purple.visible = true
