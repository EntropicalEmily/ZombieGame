extends CharacterBody2D

var wait_time_move: float = 2.0
@export var speed: int = 30
@onready var move_cooldown_timer: Timer = $MoveCooldownTimer
@onready var move_timer: Timer = $MoveTimer


var isMoving: bool = false

var random_direction: Vector2
var random_move_time: float

func _ready() -> void:
	move_cooldown_timer.wait_time = wait_time_move
	random_direction = Vector2((randf_range(-1, 1)), (randf_range(-1, 1)))
	random_move_time = randf_range(2.0, 3.0)






func _on_move_cooldown_timer_timeout() -> void:
	isMoving = true
	move_timer.wait_time = random_move_time
	move_timer.start()


func _on_move_timer_timeout() -> void:
	velocity = Vector2.ZERO
	random_direction = Vector2((randf_range(-1, 1)), (randf_range(-1, 1)))
	random_move_time = randf_range(2.0, 3.0)

func _physics_process(delta: float) -> void:
	if isMoving:
		velocity = speed * random_direction.normalized()
		move_and_slide()
