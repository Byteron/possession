extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.play(MusicPlayer.playlist.main_theme)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	if body.ID == "Rac":
		Scene.change(Scene.inter03)
	else:
		pass # Replace with function body.
