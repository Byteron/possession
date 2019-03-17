extends State

export(int) var sleep_time = 10

var time = 0

func enter(host):
	time = 0
	host.anim.stop()
	host.motion.x = 0
	print("sleep")

func exit():
	print("awake")
	pass

func _update_states(host, delta):
	time += delta
	if time > sleep_time:
		host.change_state("patrol")

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)