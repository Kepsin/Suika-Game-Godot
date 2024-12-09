extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum playerState {
	PLAY,
	DROP
}

var state : playerState

func _ready() -> void:
	$Drop.set_poke_drop(randf() * 5)

func _physics_process(_delta: float) -> void:
	if (state == playerState.PLAY):
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if (Input.is_action_just_pressed("Drop")):
			drop_item()

		move_and_slide()

func drop_item() -> void:
	if $Drop:
		state = playerState.DROP
		$Drop.freeze = 0
		$Drop.call_deferred("reparent", get_parent().get_child(2))
		await(get_tree().create_timer(.5).timeout)
		var next = load("res://Scenes/PokeSprite.tscn")
		var instance = next.instantiate()
		instance.position = position - Vector2(position.x, -5)
		instance.freeze = 1
		add_child(instance)
		await(instance.set_poke_drop(randf() * 4))
	state = playerState.PLAY
