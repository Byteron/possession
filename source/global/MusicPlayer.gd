extends Node2D

var playlist = {
	main_theme = preload("res://audio/music/Menu_Loop.wav"),
	menu_theme = preload("res://audio/music/Main_Theme_Loop.wav"),
	bar_theme = preload("res://audio/music/bar_loop.wav"),
}

var changing_animal_sfx = [
	preload("res://audio/sounds/Changing_Animals_1.wav"),
	preload("res://audio/sounds/Changing_Animals_2.wav"),
	preload("res://audio/sounds/Changing_Animals_3.wav"),
	preload("res://audio/sounds/Changing_Animals_4.wav"),
]

var pickup_sfx = [
	preload("res://audio/sounds/Collect_Items_1.wav"),
	preload("res://audio/sounds/Collect_Items_2.wav"),
	preload("res://audio/sounds/Collect_Items_3.wav"),
]

var gas_sfx = [
	preload("res://audio/sounds/Rat_Attack_1.wav"),
	preload("res://audio/sounds/Rat_Attack_2.wav"),
	preload("res://audio/sounds/Rat_Attack_3.wav"),
	preload("res://audio/sounds/Rat_Attack_4.wav"),
	preload("res://audio/sounds/Rat_Attack_5.wav"),
]

var next_track = null

onready var tween = $Tween
onready var audio = $AudioStreamPlayer

func play(track):
	if audio.stream == track:
		return
	
	next_track = track
	tween.interpolate_property(audio, "volume_db", audio.volume_db, -72, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func get_random_change_sfx():
	randomize()
	return changing_animal_sfx[randi() % changing_animal_sfx.size()]

func get_random_pickup_sfx():
	randomize()
	return pickup_sfx[randi() % pickup_sfx.size()]
	
func get_random_gas_sfx():
	randomize()
	return gas_sfx[randi() % gas_sfx.size()]

func _on_Tween_tween_completed(object, key):
	if next_track:
		audio.stream = next_track
		next_track = null
		tween.interpolate_property(audio, "volume_db", -72, AudioServer.get_bus_volume_db(1), 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		audio.play()
