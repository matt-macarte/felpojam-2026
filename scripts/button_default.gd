extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	theme.set_font(Lakkireddy,Regular, "res://assets/fonts/Lakki-Reddy/lakkireddy/LakkiReddy-Regular.ttf")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_hovered():
		theme.custom_font.outline_size = 7
	else:
		theme.custom_font.outline_size = 0
		
