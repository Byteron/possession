extends PlayerCharacter

onready var gas = $Gas
onready var gas_area = $GasArea

func interact():
	gas.emit()
	var enemies = gas_area.get_overlapping_bodies()
	for enemy in enemies:
		enemy.queue_free()

func flip_left():
	.flip_left()
	gas.scale.x = 1
	gas.position.x = 4
	gas_area.position.x = 66

func flip_right():
	.flip_right()
	gas.scale.x = -1
	gas.position.x = -12
	gas_area.position.x = -74

func _setup_states():
	._setup_states()
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall