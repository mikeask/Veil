extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Options_button_down():
	print("options pressed")
	pass # Replace with function body.


func _on_Quit_button_down():
	print("quit")
	if(get_tree().current_scene.name=="MainMenu"):
		get_tree().quit()
	get_tree().paused = false
	get_tree().change_scene("res://Vail_2.0/Scenes/UI/MainMenu.tscn")
	pass # Replace with function body.
