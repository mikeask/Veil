extends Node2D


func _ready():
	pass





func _on_Area2D_area_entered(area):
	print(area.name)
	$AnimationPlayer.play("jump")
	#area.get_parent().get_parent().get_parent().get_parent().jump()
	pass
