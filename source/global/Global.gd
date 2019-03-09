extends Node

# Constants

const GRAVITY = 980
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)

# References
var Player
var Terrain

# Toggle Fullscreen
func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		OS.window_size = Vector2(1280, 720)