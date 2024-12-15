extends Node2D

@onready var dropper: CharacterBody2D = $Dropper

var score : int

func _ready() -> void:
	SignalBus.update_game_score.connect(update_score)

func update_score(updScore : int):
	score += updScore
	$UI/Score.text = ("Score: " + str(score))

func get_score() -> int:
	return score
