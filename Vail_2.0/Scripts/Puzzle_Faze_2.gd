extends Node2D


func _ready():
	pass
func _process(delta):
	$Porta.isOpen = $buton.ativado
