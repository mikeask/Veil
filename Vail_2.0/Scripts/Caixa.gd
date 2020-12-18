extends KinematicBody2D

const WALK_FORCE = 1200
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const GRAVITY = 1100

var velocity = Vector2()

func _physics_process(delta):
	
	velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	
	velocity.y += GRAVITY * delta
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
	pass
