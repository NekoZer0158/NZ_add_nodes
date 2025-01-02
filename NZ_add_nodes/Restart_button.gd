extends Button

const MAIN = preload("res://NZ_add_nodes/Main.tscn")

func _on_pressed() -> void:
	var new_scene = MAIN.instantiate()
	get_parent().get_parent().add_child(new_scene)
	get_parent().queue_free()
