extends Node2D

onready var door = $Door

var is_open = true

func _on_Cable_snapped():
	door.open()