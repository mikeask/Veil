extends Node2D


func _ready():
	pass


func _on_Tronco_area_entered(area):
	$Level/SenaFinal/Tronco.get_node("CollisionShape2D").disabled = true
	$Level/SenaFinal/AnimationPlayer.play("TreeFall")
	pass 
