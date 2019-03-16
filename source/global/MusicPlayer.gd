extends Node2D

var playlist = {
	main_theme = preload("res://audio/music/Menu_Loop.wav"),
	menu_theme = preload("res://audio/music/Main_Theme_Loop.wav"),
	bar_theme = preload("res://audio/music/bar_loop.wav"),
}

var next_track = null

onready var tween = $Tween
onready var audio = $AudioStreamPlayer

func play(track):
	if audio.stream == track:
		return
	
	next_track = track
	tween.interpolate_property(audio, "volume_db", audio.volume_db, -72, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func _on_Tween_tween_completed(object, key):
	if next_track:
		audio.stream = next_track
		next_track = null
		tween.interpolate_property(audio, "volume_db", -72, AudioServer.get_bus_volume_db(1), 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		audio.play()