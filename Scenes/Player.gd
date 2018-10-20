extends KinematicBody2D

const vel_andar = 300
const gravidade = 1200
const vel_pulo = 600
const normal = Vector2(0,-1)

var vel_linear = Vector2(0,0)
var sprite

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	sprite = $Sprite
	pass

func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		print("cancel")
		if(get_parent().get_node("CanvasLayer").get_node("PauseMenu").visible): 
			get_parent().get_node("CanvasLayer").get_node("PauseMenu").hide()
		else:
			get_parent().get_node("CanvasLayer").get_node("PauseMenu").show()
			
			pass
		pass
		
	vel_linear.x = 0
	if(Input.is_action_pressed("ui_left")):
		vel_linear.x = -vel_andar
		sprite.set_flip_h(true)
		pass
	if(Input.is_action_pressed("ui_right")):
		vel_linear.x = vel_andar
		sprite.set_flip_h(false)
		pass
	if is_on_floor():
		vel_linear.y = 0
#		if vel_linear.x != 0:
#			sprite.play("Andando") 
#		elif sprite.get_animation() == "Pulando":
#			sprite.set_frame(1)
#		else:
#			sprite.play("Parado")
		if Input.is_action_pressed("ui_up"):
			vel_linear.y = -vel_pulo
		pass
	else:
		vel_linear.y += gravidade*delta
	move_and_slide(vel_linear, normal)
	
	if get_node("RayCast2D").is_colliding():
		print("foi")
		print(get_node("RayCast2D").get_collider().name)
		pass
	
	pass
