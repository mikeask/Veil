extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_NextLevelTrigger_area_entered(area):
	print("trigger: ", GameManager.playerProgress["level"]+1)
	var next = true
	var nextLevelScenePath = GameManager.get_new_scene_path(next)
	print("loading scene: "+nextLevelScenePath)
	get_tree().change_scene(nextLevelScenePath)
	pass # Replace with function body.
