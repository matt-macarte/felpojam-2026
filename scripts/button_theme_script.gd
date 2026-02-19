extends Button


func _process(_delta):
	if is_hovered():
		theme.custom_font.outline_size = 7
	else:
		theme.custom_font.outline_size = 0
