extends KinematicBody2D

var isOpen = false
func _ready():
	pass

func set_isOpen(state):
	isOpen = state
	if not state:
		get_parent().alavanca1 = false
		get_parent().alavanca2 = false
	pass

func _process(delta):
	if (get_parent().alavanca1 and get_parent().alavanca2) and not isOpen :
		$AnimationPorta.play("abrir_fechar")
		pass
	pass
