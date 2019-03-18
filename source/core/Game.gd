extends Node2D

onready var HUD = $HUD

onready var player = $Player

func _ready():
	MusicPlayer.play(MusicPlayer.playlist.main_theme)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		HUD.toggle_pause_menu()

func _on_Area2D_body_entered(body):
	if body.ID == "Rac":
		Scene.change(Scene.level05)
	else:
		pass # Replace with function body.
