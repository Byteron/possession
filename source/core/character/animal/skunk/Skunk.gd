extends PlayerCharacter

onready var gas = $Gas
onready var gas_area = $GasArea
onready var gas_timer = $GasTimer
onready var collision_shape = $CollisionShape2D

var ID = "Sku"

func gas():
	gas.emit()
	audio.stream = MusicPlayer.get_random_gas_sfx()
	audio.play()
	var enemies = gas_area.get_overlapping_bodies()
	for enemy in enemies:
		enemy.change_state("sleep")

func can_gas():
	return gas_timer.is_stopped()

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
	states.gas = $States/Gas