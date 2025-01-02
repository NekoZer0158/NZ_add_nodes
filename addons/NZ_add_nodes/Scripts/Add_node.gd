@icon("res://addons/NZ_add_nodes/Icons/Add.svg")
class_name Add_node
extends RefCounted

##Only add things, never contain anything

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_node = Node.new()
	if other_args.size() >= 1:
		if typeof(other_args[0]) == TYPE_STRING:
			add_script(new_node,other_args[0])
		else:
			push_error("Wrong type of a second argument 0")
	add_to_this_node.add_child(new_node)
	return new_node

static func add_script(new_node:Node,script_path:String) -> void:
	new_node.set_script(load(script_path))
