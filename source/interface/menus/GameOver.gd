extends Control

func _on_Retry_pressed():
	get_tree().reload_current_scene()

func _on_TitleScreen_pressed():
	Scene.change(Scene.TitleScreen)