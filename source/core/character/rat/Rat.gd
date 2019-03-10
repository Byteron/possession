extends PlayerCharacter

func _setup_states():
	._setup_states()
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall

	