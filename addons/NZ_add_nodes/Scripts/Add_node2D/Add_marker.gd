@icon("res://addons/NZ_add_nodes/Icons/Add_marker.svg")
class_name Add_marker
extends Add_node

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_node = create_node_and_return()
	if other_args.size() >= 1:
		var maybe_script := other_args.pop_back()
		if typeof(maybe_script) == TYPE_STRING:
			add_script(new_node,maybe_script)
		else:
			other_args.append(maybe_script)
		if other_args.size() >= 1:
			add_second_step(new_node,other_args)
	add_to_this_node.add_child(new_node)
	return new_node

static func create_node_and_return() -> Node2D:
	return Marker2D.new()

static func add_second_step(created_node:Node2D,other_args:Array) -> void:
	if other_args.size() >= 1:
		var type_other_args_0 = typeof(other_args[0])
		if type_other_args_0 == TYPE_OBJECT:
			if other_args[0] is Node2D:
				created_node.position = other_args[0].position
		elif type_other_args_0 == TYPE_VECTOR2:
			created_node.position = other_args[0]
		elif type_other_args_0 != TYPE_NIL:
			push_error("Wrong type of a second step argument 0")
		if other_args.size() >= 2:
			if typeof(other_args[1]) == TYPE_VECTOR2:
				created_node.position += other_args[1]
			else:
				push_error("Wrong type of a second step argument 1")
