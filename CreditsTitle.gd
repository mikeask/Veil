extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Text.translate(Vector2(0,-1.5))
	if($Text.position.y < -150):
		$logoFixo.show()
		pass
	pass
