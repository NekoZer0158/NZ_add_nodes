extends Marker2D

@export var random_speed : bool = false

var speed : int = 400

func _ready() -> void:
	if random_speed:
		speed = randi_range(50,250)

func _physics_process(delta: float) -> void:
	position.x += speed*delta
