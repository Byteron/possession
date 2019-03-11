extends Control

onready var pages = $Pages.get_children()

var current_page = null setget _set_current_page
var index = -1

func _input(event):
	if current_page:
		current_page.input(event)

func _ready():
	if has_next_page():
		next_page()

func next_page():
	index += 1
	_set_current_page(pages[index])

func has_next_page():
	index + 1 < pages.size()

func _set_current_page(value):
	if current_page:
		current_page.hide()
	current_page = value
	current_page.show()