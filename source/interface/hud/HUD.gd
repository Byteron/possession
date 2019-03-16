extends CanvasLayer

onready var alert = $Alert
onready var pause_menu = $Pause
onready var game_over_popup = $GameOverPopup

func toggle_pause_menu():
	if pause_menu.visible:
		pause_menu.hide()
	else:
		pause_menu.popup_centered()

func _on_Alert_seen():
	game_over_popup.popup()