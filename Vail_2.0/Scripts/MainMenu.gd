extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lumini = -1;

func _ready():
	GameManager.load_game()
	if GameManager.playerProgress == null:
		$Menu/Continue.visible = false
	else:
		$Menu/Continue.visible = true
		pass


func _process(delta):
	$Light2D.energy = $Light2D.energy+(delta/10)*lumini
	$Fog01.rotate(delta/100);
	if($Light2D.energy < 0.5):
		lumini=1
		pass
	elif($Light2D.energy > 1.5):
		lumini=-1
		pass
		
	pass


func _on_Quit_button_down():
	get_tree().quit();
	pass # replace with function body


func _on_Credits_button_down():
	get_tree().change_scene("res://Vail_2.0/Scenes/UI/CreditsTitle.tscn");
	pass # replace with function body


func _on_StartGame_button_down():
	GameManager.save_game(0,0)
	get_tree().change_scene("res://Vail_2.0/Scenes/Levels/Level1_Tutorial.tscn")
	pass # replace with function body


func _on_Continue_button_down():
	var next = false
	get_tree().change_scene(GameManager.get_new_scene_path(next))
	pass # Replace with function body.
