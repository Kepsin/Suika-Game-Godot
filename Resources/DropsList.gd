class_name PokeDropList extends Resource

@export var dropList = []

func get_dropList():
	var temp = load("res://Resources/ListofPokes.tres")
	dropList = temp.dropList
	return dropList
