extends Control

func _ready():
	MusicPlayer.play(MusicPlayer.playlist.menu_theme)

func _on_Game_pressed():
	Scene.change(Scene.Intro)

func _on_Options_pressed():
	Scene.change(Scene.Options)

func _on_Quit_pressed():
	get_tree().quit()