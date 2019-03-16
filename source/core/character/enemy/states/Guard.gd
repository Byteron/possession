extends State

var timer = null

func enter(host):
	timer = host.turn_timer
	timer.start()
	host.anim.play("idle")
	host.motion.x = 0

func exit():
	timer.stop()

func _update_states(host, delta):
	if host.is_player_in_sight() and host.is_facing_player():
		host.change_state("warned")

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)