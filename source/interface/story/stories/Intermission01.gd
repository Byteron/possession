extends "res://source/interface/story/Story.gd"

func _ready():
	._ready()
	MusicPlayer.play(MusicPlayer.playlist.bar_theme)