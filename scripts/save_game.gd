extends Node

signal has_save

const SAVE_GAME_PATH := "user:///savegame.tres"

func writeGame() -> void:
	FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	#add file.store_game aqui

func load_Save() -> Resource:
	if FileAccess.file_exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null

func check_Save() -> void:
	if FileAccess.file_exists(SAVE_GAME_PATH):
		has_save.emit()
