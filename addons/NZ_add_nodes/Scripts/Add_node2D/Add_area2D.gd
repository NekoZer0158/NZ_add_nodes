class_name Add_area2D
extends Add_node

## @experimental

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_node = create_node_and_return()
	var collision_shape : CollisionShape2D = CollisionShape2D.new()
	if other_args.size() >= 1:
		var maybe_script := other_args.pop_back()
		if typeof(maybe_script) == TYPE_STRING:
			add_script(new_node,maybe_script)
		else:
			other_args.append(maybe_script)
		if other_args.size() >= 1:
			add_second_step(new_node,collision_shape,other_args)
	add_to_this_node.add_child(new_node)
	if collision_shape.shape == null:
		collision_shape.shape = RectangleShape2D.new()
	new_node.add_child(collision_shape)
	return new_node

static func create_node_and_return() -> Node2D:
	return Area2D.new()

static func add_second_step(created_node:Node2D,collision_shape:CollisionShape2D,other_args:Array) -> void:
	if other_args.size() >= 1:
		var type_other_args_0 = typeof(other_args[0])
		if type_other_args_0 == TYPE_VECTOR2:
			created_node.scale = other_args[0]
		elif type_other_args_0 != TYPE_NIL:
			push_error("Wrong type of second step argument 0")
		if other_args.size() >= 2:
			if typeof(other_args[1]) == TYPE_VECTOR2:
				created_node.position += other_args[1]
			elif typeof(other_args[1]) != TYPE_NIL:
				push_error("Wrong type of second step argument 1")
			if other_args.size() >= 3:
				if other_args[2] is Shape2D:
					collision_shape.shape = other_args[2]
					if other_args.size() >= 4:
						if other_args[2] is CircleShape2D:
							if typeof(other_args[3]) == TYPE_FLOAT:
								collision_shape.shape.radius = other_args[3]
							else:
								push_error("Wrong type of second step argument 2")
						elif other_args[2] is RectangleShape2D:
							if typeof(other_args[3]) == TYPE_VECTOR2:
								collision_shape.shape.size = other_args[3]
							else:
								push_error("Wrong type of second step argument 2")
				else:
					push_error("Wrong type of second step argument 2")
