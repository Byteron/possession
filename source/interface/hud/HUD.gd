extends CanvasLayer

onready var pause_menu = $Pause

func toggle_pause_menu():
	if pause_menu.visible:
		pause_menu.hide()
	else:
		pause_menu.popup_centered()