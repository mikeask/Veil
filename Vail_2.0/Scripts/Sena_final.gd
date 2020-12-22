extends Node2D


func _ready():
	pass


func _on_Tronco_area_entered(area):
	print("animação")
	$Level/SenaFinal/Tronco/CollisionShape2D.disabled = true
	$Level/SenaFinal/AnimationPlayer.play("TreeFall")
	pass 
