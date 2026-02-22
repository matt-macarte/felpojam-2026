extends Control

@onready var save: Node = %Save
@onready var resume: Button = %resume


@onready var options: VBoxContainer = $Options
@onready var settings: VBoxContainer = $Settings
@onready var sobre: VBoxContainer = $Sobre

@onready var back_light: TextureRect = %backLight

# luz pulsando de fundo
@export var pulse :bool = true
@export var curve :Curve = Curve.new()
@export_range(0.0,1.0) var alpha_min :float = 0.0
@export_range(0.0,1.0) var alpha_add :float = 0.8

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
		
	change = alpha_min


func _process(_delta: float) -> void:
	time2 = time
	if pulse == true:
		transparency_flow()
	if Input.is_action_pressed("cancel"):
		get_tree().quit()
	
	
	if fadeOut == true:
		print("thcua")
		fade_out()
		
	#print(time)


func transparency_flow() -> void:
	time += get_process_delta_time() * dir * 0.8
	
	if time >= 1.0: dir = -1
	elif time <= 0: dir = 1
	change = alpha_min + time * alpha_add
	
	back_light.self_modulate = Color(1.0,1.0,1.0,change)

func fade_out() -> void:
	options.modulate = Color(1.0,1.0,1.0,time)
	alpha_min = 0.1
	# mudar toda essa transicao pra ser um canvas layer fora dessa cena
	if time <= 0.01:
		#get_tree().quit()
		back_light.top_level = true
		change = 0.8
		options.visible = false
		bye()
	

func bye() -> void:
	
	await get_tree().create_timer(1).timeout
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
		back_light.self_modulate = Color(1.0,1.0,1.0,0.8)


func _on_config_pressed() -> void:
	options.visible = false
	settings.visible = true


func _on_credits_pressed() -> void:
	options.visible = false
	sobre.visible = true



func _on_return_pressed() -> void:
	_ready()


func _on_new_game_pressed() -> void:
	
	fadeOut = true
	
	
