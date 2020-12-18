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
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_select"):
		$EscHint.show()
		$EscHint/EscHintAnimation.play()
	
	if(Input.is_action_just_pressed("ui_cancel")):
		finishAnimation()
		pass
	pass


func initCredits():
	$CreditsAnimation.play()
	pass
	
func finishAnimation():
	get_tree().change_scene("res://Vail_2.0/Scenes/UI/MainMenu.tscn")
	pass
