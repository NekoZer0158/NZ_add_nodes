@icon("res://addons/NZ_add_nodes/Icons/Add_node2D.svg")
class_name Add_node2D
extends Add_node

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_node = create_node_and_return()
	if other_args.size() >= 1:
		var maybe_script := other_args.pop_back()
		if typeof(maybe_script) == TYPE_STRING:
			add_script(new_node,maybe_script)
		other_args.push_back(maybe_script)
		if typeof(other_args[0]) == TYPE_VECTOR2:
			new_node.global_position = other_args[0]
		else:
			push_error("Wrong type of a second argument 0")
	add_to_this_node.add_child(new_node)
	return new_node

static func create_node_and_return() -> Node2D:
	return Node2D.new()
