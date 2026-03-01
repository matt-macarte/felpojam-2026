extends Control

@export var cena_inicial: StringName = &""

@onready var save: Node = %Save
@onready var resume: Button = %resume

@onready var options: VBoxContainer = $Options
@onready var settings: VBoxContainer = $Settings
@onready var sobre: VBoxContainer = $Sobre

@onready var back_light_animation: AnimationPlayer = %AnimationPlayer

# luz pulsando de fundo
@export var pulse :bool = true

var change :float
var dir := 1
var time : float = 0.0
var time2 : float

var fadeOut := false
var tchau := false
var falou := false

func _ready() -> void:
	
	options.visible = true
	settings.visible = false
	sobre.visible = false
	
	if !save.load_Save():
		resume.visible = false
	else:
		resume.visible = true



func _process(_delta: float) -> void:
	time2 = time
	
	if pulse == false:
		back_light_animation.current_animation = "idle" 
	elif pulse == true:
		back_light_animation.current_animation = "light_animation" 
	if Input.is_action_pressed("cancel"):
		get_tree().quit()



func _on_resume_pressed() -> void:
	save.load_Save()


func _on_quit_pressed() -> void:
	
	get_tree().quit()


func _on_check_pulse_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		pulse = true
	else:
		pulse = false

func _on_config_pressed() -> void:
	options.visible = false
	settings.visible = true

func _on_credits_pressed() -> void:
	options.visible = false
	sobre.visible = true

func _on_return_pressed() -> void:
	_ready()

func _on_new_game_pressed() -> void:
	Global._on_game_start()
	Global.transition_style = "purple"
	SceneLoader.load_scene(cena_inicial)
