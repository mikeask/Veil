extends Node2D


func _ready():
	pass





func _on_Area2D_area_entered(area):
	print(area.get_parent().name)
	$AnimationPlayer.play("jump")
	area.get_parent().jump()
	pass
