extends State

var left
var right

export(int) var acceleration = 20
export(int) var max_speed = 180

func enter(host):
	# host.anim.play("fall")
	host.motion.y = 0

func exit():
	pass

func _update_states(host, delta):
	
	if host.is_on_floor():
		host.motion.y = 0
		if host.motion.x == 0:
			host.change_state("idle")
		else:
			host.change_state("walk")
	
func _gravity(host, delta):
	host.motion.y += Global.GRAVITY * delta

func _movement(host, delta):
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	
	if left and not right:
		host.motion.x = clamp(host.motion.x - acceleration, -max_speed, max_speed)
		host.flip_left()
	elif right and not left:
		host.motion.x = clamp(host.motion.x + acceleration, -max_speed, max_speed)
		host.flip_right()
	else:
		host.motion.x = lerp(host.motion.x, 0, 0.05)
		if abs(host.motion.x) < 0.1:
			host.motion.x = 0
	
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)