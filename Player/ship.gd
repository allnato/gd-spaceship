extends Sprite2D
@export_group("Ship Properties")
@export_range(100, 1000, 1.0, "suffix:px/s") var top_speed: int = 100.0

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	var velocity: Vector2 = Vector2.ZERO

	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	velocity = direction * top_speed
	rotation = velocity.angle()
	position += velocity * delta
