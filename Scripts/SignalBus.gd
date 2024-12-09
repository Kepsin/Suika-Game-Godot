extends Node

#UI Buses
signal update_game_score(newScore : int)

func emit_update_game_score(newScore : int):
	update_game_score.emit(newScore)
