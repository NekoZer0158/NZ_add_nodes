extends Node

@onready var marker_2d_top: Marker2D = $Marker2DTop
@onready var marker_2d_bottom: Marker2D = $Marker2DBottom

func _ready() -> void:
	add_nodes_with_scripts()
	Add_timer.add(self,[_on_timer_timeout,true,true,1.1])
	add_area2D()
	await get_tree().create_timer(randf_range(0.5,2.5),false).timeout
	add_marker2D()

func add_nodes_with_scripts() -> void:
	Add_node.add(self,["res://NZ_add_nodes/Test_script.gd"])
	Add_node.add(self,["res://NZ_add_nodes/Second_test_script.gd"])

func add_marker2D() -> void:
	var new_marker := Add_marker.add(self,[marker_2d_top,Vector2(0,randi_range(-90,-250))])
	var new_sprite := Sprite2D.new()
	new_sprite.scale = Vector2(20,20)
	new_sprite.texture = PlaceholderTexture2D.new()
	new_marker.add_child(new_sprite)

func add_area2D() -> void:
	var new_area2D : Area2D= Add_area2D.add(self,[Vector2(1,6),Vector2(900,330),RectangleShape2D.new(),Vector2(randf_range(10.0,20.0),randf_range(15.0,50.0))])
	new_area2D.area_entered.connect(_on_area2D_area_entered)

func add_visibilityenabler() -> void:
	Add_VisibleEnabler.add(marker_2d_bottom,[Vector2(0.5,2)])

func _on_timer_timeout() -> void:
	print("Timer timeout")

func _on_area2D_area_entered(area:Area2D) -> void:
	area.get_parent().queue_free()
