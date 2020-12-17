extends KinematicBody2D

const WALK_FORCE = 1200
const WALK_MAX_SPEED = 350
const STOP_FORCE = 1300
const JUMP_SPEED = 800
const GRAVITY = 1100
var raycasatCabeca 
var velocity = Vector2()

func _ready():
	raycasatCabeca = get_node("Sprits/Corpo/Cabeca/RayCastCabeca")
	pass

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += GRAVITY * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP_SPEED
		
	
	if Input.get_action_strength("push") and raycasatCabeca.is_colliding():
		print(raycasatCabeca.get_collider().name)
		print(walk)
		get_node("Sprits/Corpo/Cabeca/RayCastCabeca").get_collider().move_and_collide(Vector2(20*delta,0))
		pass
		
		
