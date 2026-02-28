extends AudioStreamPlayer

var idle_music: = preload("uid://1aksen1s64mj")
var menu_music: = preload("uid://fjphdhes0la0")
var music: = AudioStreamPlayer2D.new()
var start = preload("uid://cgcgktwmn5n18").instantiate()



func _ready() -> void:
	start.connect("start", _on_game_start)
	add_child(music)
	music.autoplay = true
	music.bus = "Music"
	musica_menu()



func musica_menu() -> void:
	music.stream = menu_music
	music.play()

func musica_jogo() -> void:
	music.stream = idle_music
	music.play()
	

func _on_game_start() -> void:
	print("iniciou")
	musica_jogo()
