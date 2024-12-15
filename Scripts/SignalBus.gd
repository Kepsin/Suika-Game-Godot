extends Node

#UI Buses
signal update_game_score(newScore : int)
signal on_game_over()
signal unlock_character(charaacter : PokeDrop)

func emit_update_game_score(newScore : int):
	update_game_score.emit(newScore)
func emit_on_game_over():
	on_game_over.emit()
func emit_unlock_character(charaacter : PokeDrop):
	unlock_character.emit(charaacter)
