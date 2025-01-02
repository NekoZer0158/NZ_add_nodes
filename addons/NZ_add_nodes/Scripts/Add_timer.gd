@icon("res://addons/NZ_add_nodes/Icons/Add_timer.svg")
class_name Add_timer
extends Add_node

## Add timers

static func add(add_to_this_node:Node,other_args:Array=[]) -> Node:
	var new_timer : Timer = Timer.new()
	if other_args.size() >= 1:
		var maybe_script := other_args.pop_back()
		if typeof(maybe_script) == TYPE_STRING:
			add_script(new_timer,maybe_script)
		else:
			other_args.append(maybe_script)
		if typeof(other_args[0]) == TYPE_CALLABLE:
			new_timer.timeout.connect(other_args[0])
		else:
			push_error("Wrong type of argument 0")
		if other_args.size() >= 2:
			if typeof(other_args[1]) == TYPE_BOOL:
				new_timer.one_shot = other_args[1]
			else:
				push_error("Wrong type of argument 1")
			if other_args.size() >= 3:
				if typeof(other_args[2]) == TYPE_BOOL:
					new_timer.autostart = other_args[2]
				else:
					push_error("Wrong type of argument 1")
				if other_args.size() >= 4:
					if typeof(other_args[3]) == TYPE_FLOAT:
						new_timer.wait_time = other_args[3]
					else:
						push_error("Wrong type of argument 1")
	else:
		push_error("there should be at least 1 other argument")
	add_to_this_node.add_child(new_timer)
	return new_timer
