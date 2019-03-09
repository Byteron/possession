extends State

var left
var right

export(int) var acceleration = 50
export(int) var max_speed = 180

func enter(host):
	pass #host.anim.play("walk")

func exit():
	pass

func _input_states(host, event):
	
	if event.is_action_pressed("ui_up"):
		host.change_state("jump")

func _update_states(host, delta):
	if abs(host.motion.x) < 1:
		host.change_state("idle")
	
	elif not host.is_on_floor():
		host.change_state("fall")

func _movement(host, delta):
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	
	if host.is_on_wall():
		host.motion.x = 0
	
	if left and not right:
		host.motion.x = clamp(host.motion.x - acceleration, -max_speed, 0)
		host.flip_left()
	elif right and not left:
		host.motion.x = clamp(host.motion.x + acceleration, 0, max_speed)
		host.flip_right()
	else:
		host.motion.x = lerp(host.motion.x, 0, 0.3)
	
	host.move_and_slide_with_snap(host.motion, Global.DOWN, Global.UP)
