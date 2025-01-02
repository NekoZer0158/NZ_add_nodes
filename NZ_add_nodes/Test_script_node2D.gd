extends Node2D

func add_sprite() -> void:
	var add_this_sprite := Sprite2D.new()
	add_this_sprite.scale = Vector2(10,10)
	add_this_sprite.texture = PlaceholderTexture2D.new()
	add_child(add_this_sprite)
