class_name DroppableItem extends RigidBody2D

@export var pokeDrop : PokeDrop

var myScale : Vector2i


func set_poke_drop(pokeNum : int) -> void:
	pokeDrop = UseDropList.get_drop_from_array(pokeNum)
	%Sprite.texture = pokeDrop.get_texture2D()
	%Sprite.scale = pokeDrop.get_size()
	myScale = pokeDrop.get_size()
	set_bitmap_shape()

func get_pokeDrop() -> PokeDrop:
	return pokeDrop
	
func set_bitmap_shape():
	var bitMap = BitMap.new()
	if (%Sprite.texture):
		bitMap.create_from_image_alpha(%Sprite.texture.get_image())
		bitMap.resize(Vector2i(bitMap.get_size().x * %Sprite.scale.x, bitMap.get_size().y * %Sprite.scale.y))
		print(bitMap.get_size())
		var polys = bitMap.opaque_to_polygons(Rect2(Vector2.ZERO, bitMap.get_size()), 4)
		for poly in polys:
			var col = CollisionPolygon2D.new()
			col.polygon = poly
			add_child(col)
			if %Sprite.centered:
				col.position = ((col.position - Vector2(bitMap.get_size().x, bitMap.get_size().y))/2)
				
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
				new.freeze = 0
				SignalBus.emit_update_game_score(new.get_pokeDrop().get_score_amount())
				print(new.get_pokeDrop().get_score_amount())
				queue_free()
