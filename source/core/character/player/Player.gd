extends Node2D

var current = null setget _set_current

onready var audio = $AudioStreamPlayer

onready var characters = $Characters.get_children()
onready var soul = $Soul

func _input(event):
	if event.is_action_pressed("ui_down"):
		cycle_characters()

func _ready():
	Global.Animals = characters
	_set_current(0)

func cycle_characters():
	audio.stream = MusicPlayer.get_random_change_sfx()
	audio.play()
	var next = (current + 1) % characters.size()
	_set_current(next)

func _set_current(value):
	if current != null:
		characters[current].change_state("nil")
	current = value
	characters[current].make_current()
	soul.target = characters[current]