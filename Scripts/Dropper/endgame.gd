extends StaticBody2D


func _on_timer_timeout():
	get_tree().quit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.global_position.y > $Area2D.global_position.y:
		get_tree().quit()
	$Timer.start()

 # Replace with function body.
func _on_area_2d_body_exited(_body: Node2D) -> void:
	$Timer.stop()
	pass # Replace with function body.
