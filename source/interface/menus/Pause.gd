extends PopupMenu



func _on_Resume_pressed():
	hide()


func _on_Quit_pressed():
	Scene.change(Scene.TitleScreen)