extends Sprite2D
var top_speed: float = 0.0
# Timer Node
@onready var boost_timer: Timer = get_node("Boost Timer")

@export_group("Ship Properties")
@export_range(100.0, 1000.0, 1.0, "suffix:px/s") var base_speed: float = 300.0
@export_range(100.0, 1000.0, 1.0, "suffix:ps/s") var boost_speed: float = 700.0
@export_range(1, 5, 1, "suffix:sec") var boost_time: int = 1


func _ready() -> void:
	top_speed = base_speed

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	var velocity: Vector2 = Vector2.ZERO

	# Get Directional Vectors
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	# Normalize Directional Vector
	if direction.length() > 1.0:
		direction = direction.normalized()

	# Check for Boost Input
	if Input.is_action_just_pressed("ship_boost"):
		# Change top_speed to boost_speed
		top_speed = boost_speed
		boost_timer.start(boost_time)

	# Calculate velocity by combining direction and speed
	velocity = direction * top_speed

	# Update player position using velocity
	position += velocity * delta

	# Rotate the sprite based off the velocity vector
	# Only rotate if moving
	if direction != Vector2.ZERO:
		rotation = velocity.angle()


# Signal: Listen to Boost Timer Timeout
func _on_boost_timer_timeout() -> void:
	# Revert back the top speed to its original
	top_speed = base_speed
