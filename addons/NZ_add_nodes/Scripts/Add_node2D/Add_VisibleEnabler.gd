@icon("res://addons/NZ_add_nodes/Icons/Add_VisibleEnabler.svg")
class_name Add_VisibleEnabler
extends Add_node2D

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_node = create_node_and_return()
	new_node.enable_node_path = add_to_this_node.get_path()
	if other_args.size() >= 1:
		var maybe_script := other_args.pop_back()
		if typeof(maybe_script) == TYPE_STRING:
			add_script(new_node,maybe_script)
		else:
			other_args.append(maybe_script)
		if other_args.size() >= 2:
			add_second_step(new_node,other_args)
	add_to_this_node.add_child(new_node)
	return new_node

static func create_node_and_return() -> Node2D:
	return VisibleOnScreenEnabler2D.new()

static func add_second_step(created_node:Node2D,other_args:Array) -> void:
	if other_args.size() >= 1:
		if typeof(other_args[0]) == TYPE_VECTOR2:
			created_node.scale = other_args[0]
		else:
			push_error("Wrong type of a second step argument 0")
