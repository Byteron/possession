extends Node

var screen_width = 1280
var screen_hight = 720

func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		OS.window_size = Vector2(screen_width, screen_hight)