extends PlayerCharacter

var ID = "Rac"

onready var bag = $Bag

func _setup_states():
	._setup_states()
	states.idle = $States/Idle
	states.walk = $States/Walk
	states.jump = $States/Jump
	states.fall = $States/Fall

func add_item(item):
	bag.add_child(item)