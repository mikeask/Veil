extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pauseMenu


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pauseMenu = $CanvasLayer.get_node("PauseMenu")
	pass

func _process(delta):
	
	if(Input.is_action_just_pressed("ui_cancel")):
		if(get_node("CanvasLayer").get_node("PauseMenu").visible): 
			get_node("CanvasLayer").get_node("PauseMenu").hide()
			get_tree().paused = false
		else:
			get_node("CanvasLayer").get_node("PauseMenu").show()
			get_tree().paused = true
			pass
		pass
		
		pass
	pass

func _on_Quit_button_down():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body


func _on_Continue_button_down():
	pauseMenu.hide()
	get_tree().paused = false
	pass # replace with function body
