extends Node

var playerProgress;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_new_scene_path(next):
	if GameManager.playerProgress == null:
		return "res://Vail_2.0/Scenes/UI/MainMenu.tscn"
		pass
		
	var level = GameManager.playerProgress["level"]
		
	var plus = 0
	if next: 
		plus = 1
		save_game(level+1, 0)
		pass
		
	if level+plus == 0:
		return "res://Vail_2.0/Scenes/Levels/Level1_Tutorial.tscn"
		pass
	elif level+plus == 1:
		return "res://Vail_2.0/Scenes/Levels/Level2.tscn"
		pass
	elif level+plus == 2:
		return "res://Vail_2.0/Scenes/Levels/Level3.tscn"
		pass
	elif level+plus == 3:
		return "res://Vail_2.0/Scenes/Levels/Level4.tscn"
		pass
	elif level+plus == 4:
		return "res://Vail_2.0/Scenes/Levels/Level5.tscn"
		pass
	elif level+plus >= 5:
		return "res://Vail_2.0/Scenes/Levels/Level6.tscn"
		pass
	pass

func load_game():
	var open_file = File.new()
	if open_file.file_exists("user://savegame.save"):
		open_file.open("user://savegame.save", File.READ)
		# Get the saved dictionary from the next line in the save file
		playerProgress = parse_json(open_file.get_as_text())
		print("gameLoaded: ", playerProgress)
	open_file.close()
	pass


func save_game(level, checkpoint):
	print("save_game - level: ", level)
	playerProgress = {
		"level": level,
		"checkpoint": checkpoint
	}
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(playerProgress))
	save_game.close()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
