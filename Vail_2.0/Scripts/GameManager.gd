extends Node

var playerProgress;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func load_game():
	var open_file = File.new()
	if open_file.file_exists("user://savegame.save"):
		open_file.open("user://savegame.save", File.READ)
		# Get the saved dictionary from the next line in the save file
		playerProgress = parse_json(open_file.get_as_text())
		print("gameLoaded: ",playerProgress)
	open_file.close()
	pass


func save_game(level, checkpoint):
	print("level e checkpoint: ",level, checkpoint)
	var playerProgress = {
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
