
extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		get_tree().quit()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().quit()
