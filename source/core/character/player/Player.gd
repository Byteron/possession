extends Node2D


var current = null

onready var characters = $Characters.get_children()
onready var camera = $Camera2D
onready var soul = $Soul

func _ready():
	_set_current(0)

func cycle_characters():
	var next = (current + 1) % characters.size()
	_set_current(next)

func _set_current(value):
	if current != null:
		characters[current].change_state("nil")
	current = value
	characters[current].make_current()
	camera.target = characters[current]
	soul.target = characters[current]