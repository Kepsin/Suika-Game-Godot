class_name DroppableItem extends RigidBody2D

@export var pokeDrop : PokeDrop

func _ready() -> void:
	gravity_scale = 0

func set_poke_drop(pokeNum : int) -> void:
	pokeDrop = UseDropList.get_drop_from_array(pokeNum)
	$Sprite.texture = pokeDrop.get_texture2D()
	$Sprite.scale = pokeDrop.get_size()

func get_pokeDrop() -> PokeDrop:
	return pokeDrop

func _on_body_entered(body: Node) -> void:
	if (body.get_class() == "RigidBody2D"):
		if (body.get_pokeDrop() == get_pokeDrop()):
			if (body.get_index() > get_index()):
				body.queue_free()
				var temp = load("res://Scenes/PokeSprite.tscn")
				var new = temp.instantiate()
				get_parent().call_deferred("add_child", new)
				new.set_poke_drop(pokeDrop.get_order_number() + 1)
				new.position = (body.position + position) / 2
				new.gravity_scale = 1
				queue_free()
