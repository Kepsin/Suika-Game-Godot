class_name PokeDrop extends Resource 

@export var sprite : Texture2D
@export var order_number : int
@export var size : float

func get_order_number() -> int:
	return order_number
	
func get_size() -> Vector2:
	return Vector2(size, size)
	
func get_texture2D() -> Texture2D:
	return sprite
