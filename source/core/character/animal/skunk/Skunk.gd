extends PlayerCharacter

onready var gas = $Gas

func interact():
	gas.emit()

func flip_left():
	.flip_left()
	gas.scale.x = 1
	gas.position.x = 4

func flip_right():
	.flip_right()
	gas.scale.x = -1
	gas.position.x = -12

func _setup_states():
	._setup_states()
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall