extends KinematicBody2D

const WALK_FORCE = 1200
const WALK_MAX_SPEED = 350
const STOP_FORCE = 1300
const JUMP_SPEED = 800
const GRAVITY = 1100
var raycasatCabeca 
var velocity = Vector2()
var direction = "direita"



func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
		$BirdAnimation.play("Idle")
	else:
		velocity.x += walk * delta
		$BirdAnimation.play("Walk")
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += GRAVITY * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP_SPEED
		
	if walk > 0  and direction == "esquerda":
		scale.x *= -1
		direction = "direita"
	if walk < 0 and direction == "direita":
		scale.x *= -1   
		direction = "esquerda"
		
	
	if Input.get_action_strength("push") and $RayPush.is_colliding():
		if $RayPush.get_collider().is_in_group("CAIXA"):
			$RayPush.get_collider().move_and_collide(Vector2((walk*0.09)*delta,0))
			$BirdAnimation.play("Pushing")
		pass
	if Input.get_action_strength("bicada") and is_on_floor():
		$BirdAnimation.play("Pickup")
		pass
	if not is_on_floor():
		if velocity.y >=0:
			$BirdAnimation.play("Falling")
		else:
			$BirdAnimation.play("Jump")

func jump():
	velocity.y = -2300
	pass
		
		