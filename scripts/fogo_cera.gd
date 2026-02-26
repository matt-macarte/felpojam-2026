extends Area2D

signal derreteu
@export var colher:Area2D

func derreter() -> void:
	if colher.area_entered:
		print("entrou")
