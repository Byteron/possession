extends State

func enter(host):
	host.motion = Vector2(0, 0)

func exit():
	pass

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)