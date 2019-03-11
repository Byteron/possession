extends Control

signal finished

var writing = false

export(int) var speed = 35

var visible_characters = 0.0

onready var label = $NinePatchRect/RichTextLabel

func _process(delta):
	if is_complete():
		writing = false
		emit_signal("finished")
	elif writing:
		visible_characters += speed * delta
		label.visible_characters = visible_characters

func write(text):
	label.text = text
	reset()
	writing = true

func stop():
	writing = false

func reset():
	visible_characters = 0

func complete():
	label.visible_characters = len(label.text)

func is_complete():
	return label.visible_characters >= len(label.text)