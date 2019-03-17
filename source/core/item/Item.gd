class_name Item extends Node2D

var racoon = null

var picked = false

onready var audio = $AudioStreamPlayer

func _unhandled_input(event):
	if racoon and event.is_action_pressed("interact") and not picked:
		var item = _item()
		racoon.add_item(item)
		picked = true
		audio.stream = MusicPlayer.get_random_pickup_sfx()
		audio.play()

func _item():
	print("OVERWRITE!")
	return Node.new()

func _on_Area2D_body_entered(body):
	if body.name == "Racoon":
		racoon = body

func _on_Area2D_body_exited(body):
	if body.name == "Racoon":
		racoon = null

func _on_AudioStreamPlayer_finished():
	queue_free()