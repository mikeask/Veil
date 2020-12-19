extends Node2D

var alavanca1 = false
var alavanca2 = false

func _ready():
	pass

func _process(delta):
	pass

func set_alavanca1(state):
	alavanca1 = state
	pass
func set_alavanca2(state):
	alavanca2 = state
	pass


func _on_Area_2_area_entered(area):
	$Alavanca_2.get_node("AnimationAlavanca2").play("on_off")
	pass 


func _on_Area_1_area_entered(area):
	$Alavanca_1.get_node("AnimationAlavanca").play("on_off")
	pass # Replace with function body.
