extends Area2D

var is_interactable = true
var mouse = false


func _process(delta: float) -> void:
	if is_interactable == true:
		pop_on_mouse_entered()


func pop_on_mouse_entered() -> void:
	if mouse:
		self.scale *= 1.2
	elif not mouse:
		self.scale /= 1.2 
	
