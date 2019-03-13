extends PlayerCharacter

onready var gas = $Gas
onready var gas_area = $GasArea
onready var collision_shape = $CollisionShape2D

func interact():
	gas.emit()
	var enemies = gas_area.get_overlapping_bodies()
	for enemy in enemies:
		enemy.queue_free()

func flip_left():
	.flip_left()
	gas.scale.x = 1
	gas.position.x = 8
	gas_area.position.x = 69
	collision_shape.position.x = -5

func flip_right():
	.flip_right()
	gas.scale.x = -1
	gas.position.x = -8
	gas_area.position.x = -71
	collision_shape.position.x = 5

func _setup_states():
	._setup_states()
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall