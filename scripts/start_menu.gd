extends Control

@onready var save: Node = %Save
@onready var resume: Button = %resume

@onready var back_light: TextureRect = $backLight
@export var pulse :bool = true
@export var curve :Curve = Curve.new()
@export_range(0.0,1.0) var alpha_min :float = 0.2
@export_range(0.0,1.0) var alpha_max :float = 0.3

var change :float
var dir = 1
var time = 0



func _ready() -> void:
	if save.load_Save() == null:
		resume.visible = false
	else:
		resume.visible = true
		
	change = alpha_min


func _process(delta: float) -> void:
	
	if pulse == true:
		transparency_flow()


func transparency_flow() -> void:
	time += get_process_delta_time() * dir * 0.5
	
	
	if time >= 1.0: dir = -1
	elif time <= 0: dir = 1
	
	change = alpha_min + time * alpha_max
	
	back_light.self_modulate = Color(1.0,1.0,1.0,change)
	
	#print(curve.sample(time))
	print(curve)
	#print(change, " rate: ",rate)



func _on_resume_pressed() -> void:
	save.load_Save()


func _on_quit_pressed() -> void:
	get_tree().quit()
