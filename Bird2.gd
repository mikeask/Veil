extends KinematicBody2D
const gravidade = 200

const normal = Vector2(0,-1)

const velMx = 1500
var vel= Vector2()
const junpVel= 4000

var animacao = "Idle"
var novaAnimacao = "Idle"
var final = false

var direcao = "direita"
var time = 1
var time_alavanca = 30
var aberto = false
var sequencia = 0;
var pilar1 = false
var pilar2 = false
var pilar3 = false
var pilares=1
#possiveis senhas : 34(1,2,3)/30(1,3,2)/32(2,1,3)/24(2,3,1)/26(3,1,2)/22(3,2,1)
var senha


func _ready():
	
	pass


func _process(delta):
	muve()
	get_animation()
	pushing()
	pass


func muve():
	if(!final):
		vel.x = 0
		vel.y  +=gravidade
		if is_on_floor():
			vel.y = 0
		if Input.is_action_pressed("right"):
			vel.x = vel.x+velMx
			pass
		if Input.is_action_pressed("left"):
			vel.x = vel.x-velMx
			pass
		if Input.is_action_pressed("junp"):
			if  is_on_floor():
				vel.y= vel.y-junpVel
				$Jump.play()
			pass
		move_and_slide(vel,normal)
		pass



func get_animation():
	if(!final):
		if !pes_on_floor():
			if vel.y < 0 :
				novaAnimacao = "Jump"
			if vel.y > 0:
				novaAnimacao = "Falling"
			
		else:
			if vel.x > 0 ||vel.x < 0 :
				novaAnimacao = "Walk"
			if vel.x ==0 :
				novaAnimacao = "Idle"
			if Input.is_action_pressed("pickup"):
				novaAnimacao = "Pickup"
			if Input.is_action_pressed("pushi"):
				novaAnimacao = "Pushing"
				
		if animacao!=novaAnimacao:
			get_node("BirdAnimation").play(novaAnimacao)
			animacao=novaAnimacao
		
		#if Input.is_action_just_pressed("left"):
		if vel.x < 0:
				if direcao == "direita":
					scale.x = -1
					direcao = "esquerda"
					
		if vel.x>0:
				if direcao == "esquerda":
					scale.x = -1
					direcao = "direita"
		pass
	pass


func endgame():
	if(!final):
		final = true
		get_parent().get_node("KinematicBody2D/AnimationPlayer").play("TreeFall")
		get_parent().get_node("InGameTheme").stop()
		get_parent().get_node("EndingTheme").play()
	pass


func _on_Area2D_body_entered(body):
#	if(body.is_in_group("tree")):
#		endgame()
#
#	if(body.is_in_group("catapult")):
#		vel_linear.y = -vel_pulo*8
#		if !get_parent().get_node("catapult/catapultSound").playing:
#			get_parent().get_node("catapult/catapultSound").play()
#		body.get_node("CatapultAnimation").play("Catapult")
#
#	if(body.is_in_group("alavanca")):
#		get_parent().get_node("porta/AnimationPlayer").play("subir")
#		get_parent().get_node("alavanca/AnimationPlayer").play("abrir")
#		aberto = true
#
#
#	if(body.is_in_group("pilar")):
#
#		if body.get_name() == "pilar" and !pilar1:
#			get_parent().get_node("pilar/AnimationPlayer").play("LightOn")
#
#			sequencia += pilares * 2
#			pilar1 = true
#			pilares += 1
#		elif body.get_name() == "pilar2" and !pilar2:
#			get_parent().get_node("pilar2/AnimationPlayer").play("LightOn")
#
#			sequencia += pilares * 4
#			pilar2 = true
#			pilares += 1
#
#		elif body.get_name() == "pilar3" and !pilar3:
#			get_parent().get_node("pilar3/AnimationPlayer").play("LightOn")
#
#			sequencia += pilares * 8
#			pilar3 = true
#			pilares += 1
#		if pilares == 4 and sequencia != senha:
#
#			get_parent().get_node("pilar/AnimationPlayer").play("LightOff")
#			get_parent().get_node("pilar2/AnimationPlayer").play("LightOff")
#			get_parent().get_node("pilar3/AnimationPlayer").play("LightOff")
#			sequencia = 0
#			pilar1 = false
#			pilar2 = false
#			pilar3 = false
#			pilares = 1
#
#
#
#		if sequencia == senha:
#			get_parent().get_node("pilar/AnimationPlayer").play("Win")
#			get_parent().get_node("pilar2/AnimationPlayer").play("Win")
#			get_parent().get_node("pilar3/AnimationPlayer").play("Win")
#			get_parent().get_node("ponte/AnimationPlayer").play("descer")
#			pass
#
		
	pass # replace with function body

func pes_on_floor():
	if get_node("pe1").is_colliding() || get_node("pe2").is_colliding():
		return true
	else:
		return false
	pass


func pushing():
	if(!final):
		if Input.is_action_pressed("pushi"):
			var caixa
			if get_node("gancho2").is_colliding():
				caixa = get_node("gancho2").get_collider()
				if caixa.is_in_group("box"):
					if(!$Push.playing): $Push.play()
					if direcao == "direita":
						caixa.vel.x = 1000
					if direcao == "esquerda":
						caixa.vel.x = -1000
						
		else:
			$Push.stop()
		pass
