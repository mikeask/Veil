extends KinematicBody2D

const vel_andar = 600
const gravidade = 90
const vel_pulo = 1600
const normal = Vector2(0,-1)

var vel_linear = Vector2(0,0)
var animacao = "Idle"
var novaAnimacao = "Idle"
var final = false

var direcao = "direita"
var pickup = false
var time = 1
var time_alavanca = 22
var aberto = false


func _ready():
	get_node("Body/Head/Position2D/Area2D/bico")
	pass
	
func endgame():
	final = true
	get_parent().get_node("KinematicBody2D/AnimationPlayer").play("TreeFall")

func _process(delta):
	
	if(!pickup):	
		vel_linear.x = 0
		if(Input.is_action_pressed("ui_left")):
			vel_linear.x = -vel_andar*delta*100
			pass
		
		if(Input.is_action_pressed("ui_right")):
			vel_linear.x = vel_andar*delta*100
			pass
		if is_on_floor():
			vel_linear.y = 0
			if vel_linear.x != 0:
				novaAnimacao = "Walk"
			else:
				novaAnimacao = "Idle"
			if Input.is_action_pressed("ui_up"):
				vel_linear.y = -vel_pulo*delta*100
				novaAnimacao = "Jump"
				
			if(Input.is_action_pressed("pushi") ):
				novaAnimacao = "Pushing"
				if get_node("gancho").is_colliding() :
					if get_node("gancho").get_collider().is_in_group("box"):
						if direcao == "direita":
					 		get_node("gancho").get_collider().vel_linear.x = 300
						if direcao == "esquerda":
					 		get_node("gancho").get_collider().vel_linear.x = -300
					pass
				if get_node("gancho2").is_colliding():
					if  get_node("gancho2").get_collider().is_in_group("box"):
						if direcao == "direita":
					 		get_node("gancho2").get_collider().vel_linear.x = 300
						if direcao == "esquerda":
					 		get_node("gancho2").get_collider().vel_linear.x = -300
			if Input.is_action_just_pressed("pickup"):
				pickup = true
				get_node("Body/Head/Position2D/Area2D/bico").set_disabled(false)
				novaAnimacao = "Pickup"
		else:
			if(vel_linear.y > 0 and !get_node("pe2").is_colliding()and !get_node("pe1").is_colliding()):
				novaAnimacao = "Falling"
			vel_linear.y += gravidade*delta*100
		move_and_slide(vel_linear, normal)
				
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
		
	if pickup:
		if time<=0:
			time = 1
			pickup = false
			get_node("Body/Head/Position2D/Area2D/bico").set_disabled(true) 
		time -=delta
		
		
	if aberto:
		if time_alavanca<=0:
			time_alavanca= 22
			aberto = false
			get_parent().get_node("porta/AnimationPlayer").play("descer")
			get_parent().get_node("alavanca/AnimationPlayer").play("fechar")
		time_alavanca -=delta

	pass

func _on_Area2D_body_entered(body):
	if(body.is_in_group("tree")):
		final = true
		get_node("Body/Head/Position2D/Area2D/bico").queue_free()
		endgame()
		
	if(body.is_in_group("catapult")):
		vel_linear.y = -vel_pulo*8
		body.get_node("CatapultAnimation").play("Catapult")
		
	if(body.is_in_group("alavanca")):
		get_parent().get_node("porta/AnimationPlayer").play("subir")
		get_parent().get_node("alavanca/AnimationPlayer").play("abrir")
		aberto = true
		
	pass # replace with function body
