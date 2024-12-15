extends Control

func _ready() -> void:
	SignalBus.on_game_over.connect(update_final_score)

func update_final_score():
	$VBoxContainer/FinalScore.text = "Final Score: \n" + str(get_parent().get_score())
	get_parent().get_child(0).visible = false
	get_parent().get_child(3).visible = false
	visible = true

func _on_button_3_button_down() -> void:
	get_tree().quit()


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_button_button_down() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.

func _unhandled_input(_event: InputEvent) -> void:
	if (Input.is_action_just_pressed("Open_Menu")):
		visible = true
