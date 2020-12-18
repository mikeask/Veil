extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var lumini = -1;
var playerProgress = {
	"level": 0,
	"checkpoint": 1
}

func _ready():
	print("ready")
	var save_game = File.new()
	if save_game.file_exists("user://savegame.save"):
		save_game.open("user://savegame.save", File.READ)
		# Get the saved dictionary from the next line in the save file
		playerProgress = parse_json(save_game.get_as_text())
		print("playerProgress: ",playerProgress)
	else:
		save_game.open("user://savegame.save", File.WRITE)
		save_game.store_line(to_json(playerProgress))
		print(to_json(playerProgress))
	save_game.close()
	# Called when the node is added to the scene for the first time.
	# Initialization here
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
	print("aspas")
	get_tree().change_scene("res://Scenes/CreditsTitle.tscn");
	pass # replace with function body


func _on_StartGame_button_down():
	get_tree().change_scene("res://Vail_1.0//Scenes/Level.tscn");
	pass # replace with function body
