extends State

const DISCOVER_TIME = 2.0

var time = 0
var discovered = false

export(int) var speed = 100

func enter(host):
	host.anim.play("idle")
	host.spawn_suspicion_mark()
	host.motion.x = 0

func exit():
	pass

func _update_states(host, delta):
	if not host.is_player_in_sight() or not host.is_facing_player():
		host.change_state("patrol")
	
	get_tree().call_group("Suspicion", "player_seen")

func _gravity(host, delta):
	if not host.is_on_floor():
		host.motion.y += Global.GRAVITY * delta
	else:
		host.motion.y = 0

func _movement(host, delta):
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)

