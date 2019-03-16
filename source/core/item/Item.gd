class_name Item extends Node2D

var racoon = null

func _unhandled_input(event):
	if racoon and event.is_action_pressed("interact"):
		var item = _item()
		racoon.add_item(item)
		queue_free()

func _item():
	print("OVERWRITE!")
	return Node.new()

func _on_Area2D_body_entered(body):
	if body.name == "Racoon":
		racoon = body

func _on_Area2D_body_exited(body):
	if body.name == "Racoon":
		racoon = null