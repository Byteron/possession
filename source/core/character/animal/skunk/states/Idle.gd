extends State

var left
var right

func enter(host):
	# host.anim.play("idle")
	host.motion.x = 0
	
func exit():
	pass

func input(host, event):
	.input(host, event)
	if event.is_action_pressed("interact"):
		host.interact()

func _input_states(host, event):
	if event.is_action_pressed("ui_up"):
		host.change_state("jump")

func _update_states(host, delta):
	left = Input.is_action_pressed("ui_left")
	right = Input.is_action_pressed("ui_right")
	
	if left and not right or right and not left:
		host.change_state("walk")
	
	elif not host.is_on_floor():
		host.change_state("fall")