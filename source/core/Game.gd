extends Node2D

onready var HUD = $HUD

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		HUD.toggle_pause_menu()