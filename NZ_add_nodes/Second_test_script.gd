extends Node

func _ready() -> void:
	var new_node2D : Node2D = Add_node2D.add(self,[Vector2(100,100),"res://NZ_add_nodes/Test_script_node2D.gd"])
	new_node2D.add_sprite()
