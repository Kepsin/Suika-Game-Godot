extends Node

@onready var dropList : PokeDropList = load("res://Resources/ListofPokes.tres")

func get_drop_from_array(num : int) -> PokeDrop:
	if (num > dropList.get_dropList().size()):
		return
	return dropList.get_dropList()[num]
