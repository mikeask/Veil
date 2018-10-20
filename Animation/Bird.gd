extends KinematicBody2D

const vel_andar = 300
const gravidade = 1200
const vel_pulo = 600
const normal = Vector2(0,-1)

var vel_linear = Vector2(0,0)
var animacao = "Idle"
var novaAnimacao = "Idle"

var direcao = "direita"


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func _process(delta):
	
		
	vel_linear.x = 0
	if(Input.is_action_pressed("ui_left")):
		vel_linear.x = -vel_andar*delta*50
		pass
	
	if(Input.is_action_pressed("ui_right")):
		vel_linear.x = vel_andar*delta*50
		pass
	if is_on_floor():
		vel_linear.y = 0
		if vel_linear.x != 0:
			novaAnimacao = "Walk"
		else:
			novaAnimacao = "Idle"
		if Input.is_action_pressed("ui_up"):
			vel_linear.y = -vel_pulo*delta*50
			novaAnimacao = "Jump"
		pass
	else:
		vel_linear.y += gravidade*delta
	move_and_slide(vel_linear, normal)
	
#	if get_node("RayCast2D").is_colliding():
#		print("foi")
#		print(get_node("RayCast2D").get_collider().name)
#		pass
	if animacao != novaAnimacao:
		get_node("BirdAnimation").play(novaAnimacao)
		animacao = novaAnimacao
		
	if Input.is_action_just_pressed("ui_left"):
		if direcao == "direita":
			scale.x = -1
			direcao = "esquerda"
			
	if Input.is_action_just_pressed("ui_right"):
		if direcao == "esquerda":
			scale.x = -1
			direcao = "direita"
		
	
	
	pass
