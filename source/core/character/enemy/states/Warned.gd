extends State

export(int) var speed = 100

func enter(host):
	host.anim.play("warned")
	host.motion.x = 0

func exit():
	pass

func _update_states(host, delta):
	if not host.is_player_in_sight() or not host.is_facing_player():
		host.change_state("patrol")

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)

