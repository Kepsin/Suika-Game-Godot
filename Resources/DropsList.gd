class_name PokeDropList extends Resource

@export var dropList = []

func get_dropList():
	match Global.get_current_gamemode():
		Global.gamemode.PALKIA:
			var temp = load("res://Resources/ListofPokes.tres")
			dropList = temp.dropList
			return dropList
		Global.gamemode.DIALGA:
			var temp = load("res://Resources/SteelPokesList.tres")
			dropList = temp.dropList
			return dropList
		Global.gamemode.GIRATINA:
			var temp = load("res://Resources/ListofPokes.tres")
			dropList = temp.dropList
			return dropList
