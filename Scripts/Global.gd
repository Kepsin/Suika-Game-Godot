extends Node

enum gamemode {
	PALKIA,
	DIALGA,
	GIRATINA
}
var current_gamemode : gamemode = gamemode.PALKIA

func get_current_gamemode() -> gamemode:
	return current_gamemode

func set_current_gamemode(new_gamemode : gamemode) -> void:
	current_gamemode = new_gamemode
