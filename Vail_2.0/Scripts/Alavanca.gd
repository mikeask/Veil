extends KinematicBody2D

var activate = false

func set_activate(state):
	activate = state
	pass


func _on_Area_2_area_entered(area):
	$AnimationAlavanca.play("on_off")
	pass


func _on_Area_1_area_entered(area):
	$AnimationAlavanca2.play("on_off")
	pass # Replace with function body.
