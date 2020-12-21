extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		if(visible): 
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true
			pass
		pass
		
		pass
	pass

func _on_Quit_button_down():
	get_tree().paused = false
	get_tree().change_scene("res://Vail_2.0/Scenes/UI/MainMenu.tscn")
	pass # replace with function body


func _on_Continue_button_down():
	hide()
	get_tree().paused = false
	pass # replace with function body

func _on_Recomecar_nivel_button_down():
	hide()
	get_tree().paused = false
	get_tree().change_scene(GameManager.get_new_scene_path(false))
	pass # Replace with function body.
