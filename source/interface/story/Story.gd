extends Control

var current = -1 setget _set_current

export(String) var next_scene = null

onready var pages = $Pages.get_children()

func _input(event):
	if pages:
		pages[current].input(event)

func _ready():
	for page in pages:
		page.connect("finished", self, "_on_Page_finished")
		page.hide()
	if has_next_page():
		next_page()

func next_page():
	current += 1
	_set_current(current)

func has_next_page():
	return current + 1 < pages.size()

func _set_current(value):
	if current > -1:
		pages[current].fade_out()
	current = value
	pages[current].show()
	if pages[current].has_next_line():
		pages[current].next_line()
		pages[current].fade_in()

func _on_Page_finished():
	if has_next_page():
		next_page()
	else:
		Scene.change(next_scene)