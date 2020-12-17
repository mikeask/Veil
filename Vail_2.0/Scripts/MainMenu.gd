extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lumini = -1;

func _ready():
	GameManager.load_game()
	if GameManager.playerProgress == null:
		$Continue.visible = false
	else:
		$Continue.visible = true
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
	get_tree().change_scene("res://Scenes/CreditsTitle.tscn");
	pass # replace with function body


func _on_StartGame_button_down():
	GameManager.save_game(0,0)
	get_tree().change_scene("res://Vail_1.0/Scenes/Level.tscn");
	pass # replace with function body


func _on_Continue_button_down():
	print("playerProgress on continue: ", GameManager.playerProgress["level"])
	if GameManager.playerProgress["level"] == 0:
		get_tree().change_scene("res://Scenes/UI/CreditsTitle.tscn");
		pass
	if GameManager.playerProgress["level"] == 1:
		get_tree().change_scene("res://Vail_1.0/Scenes/Level.tscn");
		pass
	pass # Replace with function body.
