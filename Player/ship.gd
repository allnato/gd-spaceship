extends Area2D

@export var ship_speed: = 500.0
@export var ship_boost_speed: = 800.0
@export var boost_time: = 1.5
var speed:= 0.0
@onready var BoostTimer: Timer = $ShipBoostTimer

func _ready() -> void:
	speed = ship_speed
	BoostTimer.wait_time = boost_time
	BoostTimer.one_shot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Fetch directional inputs
	var direction: Vector2 = Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	# Normalize diagonal movements
	if direction.length() > 1.0:
		direction = direction.normalized()

	# Rotate ship with regards to direction
	if direction != Vector2.ZERO:
		rotation = direction.angle()

	var velocity:= Vector2.ZERO
	if Input.is_action_just_pressed("boost_ship"):
		BoostTimer.start()
		speed = ship_boost_speed

	velocity = direction * speed

	# Apply normal speed
	position += velocity * delta


func _on_ship_boost_timer_timeout() -> void:
	speed = ship_speed
