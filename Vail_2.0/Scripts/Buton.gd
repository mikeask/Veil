extends Area2D

var ativado = false
var objectOn = 0

func _ready():
	pass
	
func _process(delta):
	if objectOn > 0:
		ativado = true
	else : 
		ativado = false

func _on_buton_body_entered(body):
	objectOn +=1
	pass


func _on_buton_body_exited(body):
	objectOn -=1
	pass 
