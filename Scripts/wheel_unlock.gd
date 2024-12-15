extends Control

var wheel_images
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match Global.get_current_gamemode():
		Global.gamemode.PALKIA:
			wheel_images = [$Circle/Feebas, $Circle/Spheal, $Circle/Squirtle, $"Circle/Lumineon-f", $Circle/Vaporeon, $Circle/Swanna, $"Circle/Quagsire-f", $Circle/Simipour, $"Circle/Keldeo-ordinary", $Circle/Suicune, $Circle/Palkia]
		Global.gamemode.DIALGA:
			wheel_images = [$Circle/Magnamite, $Circle/Klink, $Circle/Durant, $Circle/Forretress, $Circle/Lairon, $Circle/Mawile, $Circle/Skarmory, $Circle/Metagross, $Circle/Jirachi, $Circle/Registeel, $Circle/Dialga]
		Global.gamemode.GIRATINA:
			get_tree().change_scene_to_file("res://Scenes/main.tscn")
	SignalBus.unlock_character.connect(unlock_character_on_wheel)
	pass # Replace with function body.

func unlock_character_on_wheel(character : PokeDrop) -> void:
	for charac in wheel_images:
		if(charac.modulate == Color(1, 1, 1)):
			continue
		if(charac.texture == character.get_texture2D()):
			charac.modulate = Color(1, 1, 1)
