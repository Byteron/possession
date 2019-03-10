extends State

var gravitation = false
var time = 0

var jump
var left
var right

export(int) var jump_force = 220
export(int) var acceleration = 20
export(int) var max_speed = 180
export(float) var jump_extention_time = 0.20

func enter(host):
	# host.anim.play("jump")
	host.motion.y = -jump_force

func exit():
	gravitation = false
	time = 0

func _update_states(host, delta):
	
	if host.motion.y >= 0 or host.is_on_ceiling():
		host.change_state("fall")
	
	if host.is_on_floor():
		host.change_state("idle")

func _gravity(host, delta):
	jump = Input.is_action_pressed("ui_up")
	
	if gravitation:
		host.motion.y += Global.GRAVITY * delta
	elif not gravitation and not jump:
		gravitation = true
	else:
		time += delta
		if time > jump_extention_time:
			gravitation = true

func _movement(host, delta):
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	
	if host.is_on_wall():
		host.motion.x = 0
	
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