extends Node2D

onready var HUD = $HUD

onready var player = $Player

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		HUD.toggle_pause_menu()
	
	if event.is_action_pressed("ui_down"):
		player.cycle_characters()