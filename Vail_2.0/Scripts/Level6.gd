extends Node2D

var gateOpen = false

func _ready():
	pass
func _process(delta):
	if $Puzzle_senha.isCerto and not gateOpen:
		gateOpen = true
		$Ponte/AnimationPlayer.play("Abrir")
		

