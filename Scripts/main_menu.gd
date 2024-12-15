extends Control



func _on_button_pressed() -> void:
	match Global.get_current_gamemode():
		Global.gamemode.PALKIA:
			get_tree().change_scene_to_file("res://Scenes/palkia_main.tscn")
		Global.gamemode.DIALGA:
			get_tree().change_scene_to_file("res://Scenes/dialga_main.tscn")
		Global.gamemode.GIRATINA:
			get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	match Global.get_current_gamemode():
		Global.gamemode.PALKIA:
			Global.set_current_gamemode(Global.gamemode.DIALGA)
			$Beach.texture = load("res://Assets/Backgrounds/co7itML.png")
			$Beach.scale = Vector2(1.867, 1.867)
		Global.gamemode.DIALGA:
			Global.set_current_gamemode(Global.gamemode.GIRATINA)
			$Beach.texture = load("res://Assets/Backgrounds/Distortion_World.png")
		Global.gamemode.GIRATINA:
			Global.set_current_gamemode(Global.gamemode.PALKIA)
			$Beach.texture = load("res://Assets/Backgrounds/Beach.jpg")
	pass # Replace with function body.
