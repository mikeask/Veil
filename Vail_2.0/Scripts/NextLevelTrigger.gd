extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NextLevelTrigger_area_entered(area):
	var next = true
	#GameManager.save_game(GameManager.playerProgress["level"]+1, 0)
	#get_tree().change_scene(GameManager.get_new_scene_path(next))
	pass # Replace with function body.
