class_name State extends Node

func enter(host):
	print("Enter State: ", name)

func exit():
	print("Exit State: ", name)

func input(host, event):
	_input_states(host, event)

func update(host, delta):
	_gravity(host, delta)
	_movement(host, delta)
	_update_states(host, delta)

func _input_states(host, event):
	pass

func _update_states(host, delta):
	pass

func _gravity(host, delta):
	pass

func _movement(host, delta):
	pass