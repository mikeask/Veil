extends KinematicBody2D

const WALK_FORCE = 1200
const WALK_MAX_SPEED = 350
const STOP_FORCE = 1300
const JUMP_SPEED = 800
const GRAVITY = 1100
var raycasatCabeca 
var velocity = Vector2()
var direction = "direita"
var rng = RandomNumberGenerator.new()
var animacao = "Idle"
var animacao_ant = ""
var lastCollider

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
		animacao = "Idle"
	else:
		velocity.x += walk * delta
		if(!$BirdStep.playing && is_on_floor()):
			rng.randomize()
			$BirdStep.pitch_scale = rng.randf_range(0.6, 1.2)
			$BirdStep.attenuation = rng.randf_range(1.3, 3.0)
			$BirdStep.play()
			animacao = "Walk"
			pass
	$BirdAnimation.play(animacao)
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += GRAVITY * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		rng.randomize()
		$BirdTweet.pitch_scale = rng.randf_range(0.5, 3.0)
		$BirdTweet.attenuation = rng.randf_range(0.5, 5.0)
		$BirdTweet.play()
		velocity.y = -JUMP_SPEED
		
	if walk > 0  and direction == "esquerda":
		scale.x *= -1
		direction = "direita"
	if walk < 0 and direction == "direita":
		scale.x *= -1   
		direction = "esquerda"
		
	
	if Input.is_action_pressed("push") and $RayPush.is_colliding():
		if $RayPush.get_collider().is_in_group("CAIXA"):
			$RayPush.get_collider().drag()
			$RayPush.get_collider().move_and_collide(Vector2((walk*0.09)*delta,0))
			lastCollider = $RayPush.get_collider()
			animacao = "Pushing"
		else:
			$RayPush.get_collider().stop_drag()
		pass
	if Input.is_action_pressed("bicada") and is_on_floor():
		animacao = "Pickup"
		pass
	if not is_on_floor():
		if velocity.y >=0:
			animacao = "Falling"
		else:
			animacao = "Jump"
	if animacao != animacao_ant:
		$BirdAnimation.play(animacao)
		animacao_ant = animacao
	pass

func jump():
	velocity.y = -2300
	pass
		
		
