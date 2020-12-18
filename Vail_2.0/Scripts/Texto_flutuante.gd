extends Area2D


func _ready():
	pass



func _on_Texto_flutuante_body_entered(body):
	get_node("AnimationPlayer").play("show")
	pass # Replace with function body.

func _on_Texto_flutuante_body_exited(body):
	get_node("AnimationPlayer").play("hidden")
	pass # Replace with function body.
