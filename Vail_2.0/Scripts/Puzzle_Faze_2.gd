extends Node2D


var current_animation = ""
var animation = ""

func _ready():
	pass
func _process(delta):
	$Porta.isOpen = $buton.ativado
	
	if $buton.ativado:
		current_animation = "DownAnimation"
	else :
		current_animation = "UpAnimation"
	if current_animation != animation:
		$buton.get_node("AnimationPlayer").play(current_animation)
		animation = current_animation
