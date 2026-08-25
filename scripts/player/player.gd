extends CharacterBody2D

var movement_vector: Vector2


func _physics_process(_delta: float) -> void:
	movement_vector = Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	if movement_vector != Vector2.ZERO:
		velocity = 100 * movement_vector.normalized()
		move_and_slide()
