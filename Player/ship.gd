extends Area2D

@export var speed: = 300.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Fetch directional inputs
	var direction: Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	# Apply speed
	var velocity: Vector2 = direction * speed
	position += velocity * delta
