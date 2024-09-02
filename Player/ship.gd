extends Sprite2D
@export_group("Ship Properties")
@export_range(100, 1000, 1.0, "suffix:px/s") var top_speed: int = 100.0

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	var velocity: Vector2 = Vector2.ZERO

	# Get Directional Vectors
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	# Normalize Directional Vector
	if direction.length() > 1.0:
		direction = direction.normalized()

	# Calculate velocity by combining direction and speed
	velocity = direction * top_speed

	# Update player position using velocity
	position += velocity * delta

	# Rotate the sprite based off the velocity vector
	# Only rotate if moving
	if direction != Vector2.ZERO:
		rotation = velocity.angle()
