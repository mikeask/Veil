extends KinematicBody2D

var gravidade = 200

var vel_linear = Vector2(1000,0)
const normal = Vector2(0,-1)


func _ready():
	pass
  
func _process(delta):
	vel_linear.y += gravidade*10
	move_and_slide(vel_linear, normal)
	
	vel_linear = Vector2(0,0)
	
	
	pass
