extends "res://source/core/Game.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	Scene.change(Scene.Ending)
	print("Ending")
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	Scene.change(Scene.Ending)
	pass # Replace with function body.
