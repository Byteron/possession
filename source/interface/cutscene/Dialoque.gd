class_name Dialoque extends Control

var pages = ["This is a nice textbox", "It has multiple pages! Woho!"]

var current = -1 setget _set_current

onready var text_box = $TextBox

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if has_next_page() and not is_writing():
			next_page()
		elif is_writing():
			complete()

func _ready():
	next_page()

func next_page():
	current += 1
	_set_current(current)

func has_next_page():
	return current +1 < pages.size()

func complete():
	text_box.complete()

func is_writing():
	return text_box.writing

func _set_current(value):
	current = value
	text_box.write(pages[current])