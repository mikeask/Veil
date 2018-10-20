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
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu.hide()
	
	if(Input.is_action_just_pressed("ui_cancel")):
		
		if(get_node("CanvasLayer").get_node("PauseMenu").visible): 
			get_node("CanvasLayer").get_node("PauseMenu").hide()
		else:
			get_node("CanvasLayer").get_node("PauseMenu").show()
			
			pass
		pass
		
		pass
	pass


func _on_PlayGame_button_down():
	pauseMenu.hide()
	
	pass # replace with function body


func _on_Quit_button_down():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body
