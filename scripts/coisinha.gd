extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var mouse_dentro := false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	mudar_sprite()


func mudar_sprite() -> void:
	if Input.is_action_just_pressed("interact") and mouse_dentro:
		print("clicou")
		match animated_sprite_2d.animation:
			"default":
				animated_sprite_2d.animation = "feliz"
				pass
			"feliz":
				animated_sprite_2d.animation = "suando"
				pass
			"suando":
				animated_sprite_2d.animation = "morrendo"
				pass
			"morrendo":
				animated_sprite_2d.animation = "default"
				pass

func pop_on_mouse_entered(mouse:bool) -> void:
	if mouse:
		self.scale = Vector2(0.7,0.7)
	elif not mouse:
		self.scale *= Vector2(0.5,0.5)

func _on_mouse_entered() -> void:
	mouse_dentro = true
	self.scale *= 1.2


func _on_mouse_exited() -> void:
	mouse_dentro = false
	self.scale /= 1.2
