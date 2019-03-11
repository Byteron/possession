extends Control

var writing = false

export(int) var speed = 35

var visible_characters = 0.0

onready var label = $NinePatchRect/RichTextLabel

func _process(delta):
	if is_complete():
		writing = false
	elif writing:
		visible_characters += speed * delta
		label.visible_characters = visible_characters

func write(line):
	label.text = line
	reset()
	writing = true
	print("start writing textbox")

func stop():
	writing = false

func reset():
	visible_characters = 0.0
	label.visible_characters = 0
	print("reset textbox")

func complete():
	label.visible_characters = len(label.text)
	print("complete textbox")

func is_complete():
	return label.visible_characters >= len(label.text)
	print("textbox is complete")