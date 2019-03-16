extends State

export(int) var speed = 100

func enter(host):
	host.anim.play("patrol")
	host.motion.x = 0

func exit():
	pass

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	
	if host.is_on_wall() or not host.is_on_floor() and host.flip_timer.is_stopped():
		host.flip()
		host.flip_timer.start()
	
	if host.is_facing_right():
		host.motion.x = speed
	else:
		host.motion.x = -speed
	
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)

