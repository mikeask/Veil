extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pauseMenu
var canvas

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

	pauseMenu = $Bird/Camera2D/CanvasLayer/PauseMenu
	canvas = $Bird/Camera2D/CanvasLayer
	

	pass

func _process(delta):
	
	if(Input.is_action_just_pressed("ui_cancel")):
		if(canvas.get_node("PauseMenu").visible): 
			canvas.get_node("PauseMenu").hide()
			get_tree().paused = false
		else:
			canvas.get_node("PauseMenu").show()
			get_tree().paused = true
			pass
		pass
		
		pass
	pass

func _on_Quit_button_down():
	print("quit")
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body


func _on_Continue_button_down():
	print("continue")
	canvas.get_node("PauseMenu").hide()
	get_tree().paused = false
	pass # replace with function body
