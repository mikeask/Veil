extends KinematicBody2D
var isOpen = false
var vel = 60
func _ready():
	pass
	
func _process(delta):
	
	if isOpen and position.y < 320: 
		position.y = position.y + (vel * delta) 
	elif not isOpen and position.y > -33:
		position.y = position.y - (vel * delta) 
	pass
