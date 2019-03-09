extends Camera2D

var target = null

func _process(delta):
	if target:
		global_position = target.global_position