extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var playing = false
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func _process(delta):
    
	if Input.is_action_just_pressed("ui_select") || Input.is_action_just_pressed("ui_accept"):
		$EscHint.show()
	
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
		pass
	pass


func initCredits():
	$CreditsAnimation.play()
	pass
	
func finishAnimation():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass