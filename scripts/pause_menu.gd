extends Control

@onready var sair: Button = %sair
@onready var settings: Button = %settings
@onready var quit: Button = %quit

@onready var settings_menu: VBoxContainer = %Settings
@onready var buttons_menu: VBoxContainer = %buttons



func _ready() -> void:
	settings_menu.hide()
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel") and !get_tree().paused:
		pause()
	if event.is_action_pressed("cancel") and get_tree().paused:
		resume()

func pause() -> void:
	get_tree().paused = true

func resume() -> void:
	get_tree().paused = false
	hide()

func _on_resume_pressed() -> void:
	resume()

func _on_reset_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	buttons_menu.hide()
	settings_menu.show()


func _on_quit_pressed() -> void:
	Global.variaveis.cena = "purple"
	SceneLoader.load_scene(Global.trampo_uid)


func _on_return_pressed() -> void:
	buttons_menu.show()
	settings_menu.hide()
